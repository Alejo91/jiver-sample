/**
 * Created by James on 15. 9. 18..
 */

var nickName = null;
var channelListPage = 0;

$(document).ready(function() {

  $('#file_input_field').change(function() {
    if ($('#file_input_field').val().trim().length == 0) return;

    var file = $('#file_input_field')[0].files[0];
    var fileUrl = jiver.uploadFile(file);
    console.log(fileUrl);

    var fileInfo = {
      "url": fileUrl,
      "name": file.name,
      "type": file.type,
      "size": file.size,
      "custom": ''
    };
    jiver.fileMsg(fileInfo);

    $('#file_input_field').val('');
  });

  $('#btn_curr_member_list').click(function() {
    $('#member_canvas').html(getMemberList(currChannelUrl));
    $('#member_modal').modal('show');
  });

  $('#btn_open_chat_list').click(function () {
    var page = 1;
    var limit = 20;

    $('#channel_canvas').html(getChannelList(page, limit));

    $('#channel_modal').modal('show');
  });
  $('#channel_modal').on('hidden.bs.modal', function (e) {
    if (currChannelUrl == null || currChannelUrl == undefined || currChannelUrl.trim().length == 0) {
      $('#channel_modal').modal('show');
    }
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

  $('#channel_search_btn').on('click', function() {
    var query = $('#channel_search_input').val();

    if (query == null || query == undefined || query.trim().length == 0) {
      if(!confirm('Empty string is run that search all channel list.\nAre you want?')) {
        return false;
      }
    }

    $('#channel_canvas').html(getChannelSearch(query));

  });


  init();

});


function init() {
  nickName = decodeURI(decodeURIComponent(getUrlVars()['nickname']));
  console.log('nickname : ', nickName);

  startJiver(nickName);
  jiver.setDebugMessage(true);

  $('#btn_open_chat_list').click();
}


function getChannelList(page, limit) {
  var page = page;  // this value is setting channel list page that get from JIVER server.
  var limit = limit; // this value is setting max number of channel list that get from JIVER server.

  // this function is get channel list from JIVER server.
  var channelList = jiver.getChannelList(page, limit);

  // channel list
  var channelListHtml = createChannelPanel(channelList);
  channelListPage = channelList['page'];
  return channelListHtml;
}

function getChannelSearch(query) {
  var query = query; // this value is the string that users wanted search.

  // this function is that search channel list that user typed as input field.
  var channelList = jiver.getChannelSearch(query);
  console.log(channelList);

  var channelListHtml = createChannelPanel(channelList);
  channelListPage = channelList['page'];
  return channelListHtml;
}

function createChannelPanel(obj) {
  // channel list
  var channelListHtml = '';
  $.each(obj['channels'], function(index, channel) {
    if ( !(channel['channel_url'] == currChannelUrl) ) {
      channelListHtml += channelPanel(index, channel);
    }
  });

  // load more btn
  if (obj['next'] != 0) {
    channelListHtml += channelLoadMore()
  }

  return channelListHtml;
}

function channelPanel(index, obj) {
  var returnStr = '';

  returnStr += '<div class="panel panel-default" style="margin-bottom: 10px;" id="channel_panel_'+index+'" >' +
    '<div class="panel-body">' +
    '<div class="col-md-8">' +
    obj['name'] +
    '</div>' +
    '<div class="col-md-2">' +
    '<button class="btn btn-danger" onclick="leaveChannel(\'' + index + '\', \''+obj['channel_url']+'\')">' +
    '<span class="glyphicon glyphicon-log-out" aria-hidden="true"> Leave</span>' +
    '</button>' +
    '</div>' +
    '<div class="col-md-2">' +
    '<button class="btn btn-primary" onclick="joinChannel(\''+obj['channel_url']+'\')">' +
    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"> Join</span>' +
    '</button>' +
    '</div>' +
    '</div>' +
    '</div>';

  return returnStr;
}

function channelLoadMore() {
  var returnStr = '';

  returnStr += '<div style="text-align: center; margin-top: 20px;" id="channel_more_div">' +
    '<button class="btn btn-default" id="channel_more" ' +
    ' onclick="$(\'#channel_more_div\').remove(); ' +
    ' var page = channelListPage + 1; ' +
    ' var limit = 20; ' +
    ' $(\'#channel_canvas\').html($(\'#channel_canvas\').html() + getChannelList(page, limit));"' +
    ' >MORE</button>' +
    '</div>';

  return returnStr;
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
    memberListHtml += memberPanel(index, member);
  });

  return memberListHtml;
}

function memberPanel(index, member) {
  var returnStr = '';

  returnStr += '<div class="panel panel-default" style="margin-bottom: 10px;" id="member_panel_'+index+'" >' +
    '<div class="panel-body">' +
    '<div class="col-md-8">' + member['nickname'] + '</div>' +
    '</div>' +
    '</div>';

  return returnStr;
}