/**
 * Created by James on 15. 9. 18..
 */

var nickName = null;
var channelListPage = 0;

$(document).ready(function() {

  $('#btn_msg_chat_list').click(function () {
    var page = 1;
    var limit = 20;

    $('#channel_canvas').html(getMessagingList(page, limit));

    $('#channel_modal').modal('show');
  });
  $('#channel_modal').on('hidden.bs.modal', function (e) {
    if (currChannelUrl == null || currChannelUrl == undefined || currChannelUrl.trim().length == 0) {
      $('#channel_modal').modal('show');
    }
  });

  $('#btn_member_list').click(function() {
    $('#messaging_canvas').html(getMemberList('jia_test.Lobby'));
    $('#messaging_modal').modal('show');
  });
  $('#messaging_modal').on('hidden.bs.modal', function (e) {
    if (currChannelUrl == null || currChannelUrl == undefined || currChannelUrl.trim().length == 0) {
      $('#messaging_modal').modal('show');
    }
  });

  $('#btn_curr_member_list').click(function() {
    $('#member_canvas').html(getCurrentMemberList(currChannelUrl));
    $('#member_modal').modal('show');
  });

  $('#send_msg').click(function() {
    var msg = $('#msg_input').val();

    // this function is user send the message.
    jiver.msg(msg);

    $('#msg_input').val('');
  });

  $('#chat_canvas').on('scroll', function() {
    var currHeight = $('#chat_canvas').scrollTop();
    if (currHeight == 0) {
      loadMoreChatMessage();
    }
  });


  init();

});


function init() {
  nickName = decodeURI(decodeURIComponent(getUrlVars()['nickname']));
  console.log(nickName);

  startJiver(nickName);
  jiver.setDebugMessage(false);

  if (getUrlVars()['type'] == 'start') {
    $('#btn_member_list').click();
  } else {
    $('#btn_msg_chat_list').click();
  }

}


function getMessagingList(page, limit) {
  var page = page;  // this value is setting channel list page that get from JIVER server.
  var limit = limit; // this value is setting max number of channel list that get from JIVER server. if set 0, get all list.

  // this function is get channel list from JIVER server.
  var channelList = jiver.getMessagingChannelList(page, limit);
  console.log(channelList);

  if (channelList['channels'].length == 0) {
    return emptyList();
  }

  // channel list
  var channelListHtml = createMessagingPanel(channelList);

  channelListPage = channelList['page'];

  return channelListHtml;
}

function emptyList() {
  var returnStr = '';

  returnStr += '<div class="panel panel-default" style="margin-bottom: 10px;">' +
    '<div class="panel-body">' +
    '<div class="col-md-12" style="text-align: center;">' +
    'Empty List' +
    '</div>' +
    '</div>' +
    '</div>';

  return returnStr;
}

function createMessagingPanel(obj) {
  // channel list
  var channelListHtml = '';
  console.log(obj);
  $.each(obj['channels'], function(index, channel) {
    channelListHtml += messagingPanel(index, channel);
  });

  // load more btn
  if (obj['next'] != 0) {
    channelListHtml += messagingChannelLoadMore()
  }

  return channelListHtml;
}

function messagingPanel(index, obj) {
  var returnStr = '';
  var channelName = '';
  $.each(obj['members'], function(index, member) {
    if (index == 0) {
      channelName += member['name']
    } else {
      channelName += ', ' + member['name']
    }
  });

  returnStr += '<div class="panel panel-default" style="margin-bottom: 10px;" id="messaging_panel_'+index+'" >' +
    '<div class="panel-body">' +
    '<div class="col-md-8">' +
    channelName +
    '</div>' +
    '<div class="col-md-2">' +
    '<button class="btn btn-danger" onclick="endMessaging(\'' + index + '\', \''+obj['channel']['channel_url']+'\')">' +
    '<span class="glyphicon glyphicon-log-out" aria-hidden="true"> Leave</span>' +
    '</button>' +
    '</div>' +
    '<div class="col-md-2">' +
    '<button class="btn btn-primary" onclick="joinChannel(\''+obj['channel']['channel_url']+'\')">' +
    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"> Join</span>' +
    '</button>' +
    '</div>' +
    '</div>' +
    '</div>';

  return returnStr;
}

function messagingChannelLoadMore() {
  var returnStr = '';

  returnStr += '<div style="text-align: center; margin-top: 20px;" id="messaging_channel_more_div">' +
    '<button class="btn btn-default" id="messaging_channel_more" ' +
    ' onclick="$(\'#messaging_channel_more_div\').remove(); ' +
    ' var page = channel_list_page + 1; ' +
    ' var limit = 20; ' +
    ' $(\'#channel_canvas\').html($(\'#channel_canvas\').html() + getMessagingList(page, limit));" ' +
    ' >MORE</button>' +
    '</div>';

  return returnStr;
}

function endMessaging(index, channelUrl) {
  var url = channelUrl; // this value is channel url that users wanted leave.

  // This function let user leave the channel that user belongs to.
  var channelInfo = jiver.endMessaging(url);
  console.log(channelInfo);

  var deletePanel = 'messaging_panel_'+index;
  $('#'+deletePanel).remove();

  if (currChannelUrl == channelUrl) {
    $('#btn_member_list').click();
  }

  return channelInfo;
}


function getMemberList(channelUrl) {
  // this function is get member list from JIVER server.
  var memberList = jiver.getMemberList(channelUrl);
  console.log(memberList);

  return createMemberPanel(memberList);
}

function createMemberPanel(obj) {
  // member list
  var memberListHtml = '';
  $.each(obj['members'], function(index, member) {
    if ( !jiver.isCurrentUser(member['guest_id']) ) {
      memberListHtml += memberPanel(index, member);
    }
  });

  return memberListHtml;
}

function memberPanel(index, member) {
  var returnStr = '';

  returnStr += '<div class="panel panel-default" style="margin-bottom: 10px;" id="member_panel_'+index+'" >' +
    '<div class="panel-body">' +
    '<div class="col-md-8">' +
    member['nickname'] +
    '</div>';

  if ( !(currChannelUrl == null || currChannelUrl == undefined || currChannelUrl.trim().length == 0) ) {
    returnStr += '<div class="col-md-2">' +
        '<button class="btn btn-success" onclick="inviteMember(\''+member['guest_id']+'\')">' +
        '<span class="glyphicon glyphicon-log-out" aria-hidden="true"> Invite</span>' +
        '</button>' +
        '</div>';
  }

  returnStr += '<div class="col-md-2">' +
    '<button class="btn btn-primary" onclick="messageMember(\''+member['guest_id']+'\')">' +
    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"> Start Msg.</span>' +
    '</button>' +
    '</div>' +
    '</div>' +
    '</div>';

  return returnStr;
}

function inviteMember(guestId) {
  var messagingChannelInfo = jiver.inviteMessaging(guestId);
  console.log(messagingChannelInfo);
  var newMessagingUrl = messagingChannelInfo['channel']['channel_url'];
  joinChannel(newMessagingUrl);
  $('#messaging_modal').modal('hide');
}

function messageMember(guestId) {
  var messagingChannelInfo = jiver.startMessaging(guestId);
  console.log(messagingChannelInfo);
  joinChannel(messagingChannelInfo['channel']['channel_url']);
  $('#messaging_modal').modal('hide');
}


function getCurrentMemberList(channelUrl) {
  // this function is get member list from JIVER server.
  var memberList = jiver.getMemberList(channelUrl);
  console.log(memberList);

  return createCurrentMemberPanel(memberList);
}

function createCurrentMemberPanel(obj) {
  // member list
  var memberListHtml = '';
  $.each(obj['members'], function(index, member) {
    memberListHtml += currentMemberPanel(index, member);
  });

  return memberListHtml;
}

function currentMemberPanel(index, member) {
  var returnStr = '';

  returnStr += '<div class="panel panel-default" style="margin-bottom: 10px;" id="member_panel_'+index+'" >' +
    '<div class="panel-body">' +
    '<div class="col-md-8">' + member['nickname'] + '</div>' +
    '</div>' +
    '</div>';

  return returnStr;
}