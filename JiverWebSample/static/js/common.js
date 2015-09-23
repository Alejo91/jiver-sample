/**
 * Created by James on 15. 9. 18..
 */

var appId = 'A7A2672C-AD11-11E4-8DAA-0A18B21C2D82'; // Sample JIVER app id
var jiver = null;
var currChannelInfo = {};
var currChannelUrl = null;

function startJiver(nickName) {

  /** JIVER Settings */
  var option = {
    app_id: appId,  // Sample JIVER app
    user_name: nickName,  // Generate User Nickname
    image_url: '' // if you  want setting user image, set this value. if you don't, you delete this value or set empty value
  };
  jiver = new Jiver(option); // create JIVER

  // this event is a function that run when receive message
  jiver.events.onMessageReceived = function(obj) {
    setChatMessage(obj);
  };

  // this event is a function that run when receive system message
  jiver.events.onSystemMessageReceived = function(obj) {
    console.log('SYS : ', obj);
    // do something...
  };
  /** END JIVER Settings */

}

function leaveChannel(index, channelUrl) {
  var url = channelUrl; // this value is channel url that users wanted leave.

  // This function let user leave the channel that user belongs to.
  var channelInfo = jiver.channelLeave(url);
  console.log(channelInfo);

  return channelInfo;
}

function joinChannel(channelUrl) {
  var url = channelUrl; // this value is channel url that users wanted join.

  // This function let user join the channel that user belongs to.
  currChannelInfo = jiver.joinChannel(url);
  console.log(currChannelInfo);

  initChatMessage(currChannelInfo);

  $('#channel_modal').modal('hide');

  return currChannelInfo;
}

function initChatMessage(info) {
  $('#chat_canvas').html('');
  currChannelUrl = info['channel_url']; // set global value
  setWelcomeMessage(info['name']);
}

function setWelcomeMessage(channelName) {
  var welcomeStr = '<h1>Welcome to <b style="color: #000;">' + channelName + ' </b></h1>';
  $('#welcome_canvas').html(sysMessage(welcomeStr));
  $('#welcome_modal').modal('show');
  setTimeout(function() { $('#welcome_modal').modal('hide'); }, 1000);
}

function setChatMessage(obj) {
  var msgList = messageList(obj);

  $('#chat_canvas').html($('#chat_canvas').html() + msgList);
  var maxHeight = document.getElementById("chat_canvas").scrollHeight;
  $('#chat_canvas').scrollTop(maxHeight);
}

function messageList(obj) {
  var msgList = '';

  // this function is that compare to current user using users id that input parameter.
  if (jiver.isCurrentUser(obj['user']['guest_id'])) {
    msgList += userMessage(obj);
  } else {
    msgList += memberMessage(obj);
  }
  return msgList;
}

function userMessage(obj) {
  return '<li class="list-group-item chat-user"><b>'+ obj['user']['name'] +' : </b> ' + obj['message'] + '</li>';
}

function memberMessage(obj) {
  return '<li class="list-group-item chat-member"><b>'+ obj['user']['name'] +' : </b> ' + obj['message'] + '</li>';
}

function sysMessage(msg) {
  return '<li class="list-group-item chat-system">' + msg + '</li>';
}

function loadMoreChatMessage() {
  var currHeight = document.getElementById("chat_canvas").scrollHeight;

  // this function is that get message from server.
  var moreMessage = jiver.messageLoadMore();
  console.log(moreMessage);

  var msgList = '';
  $.each(moreMessage.reverse(), function(index, msg) {
    msgList += messageList(msg);
  });

  $('#chat_canvas').html(msgList + $('#chat_canvas').html());
  $('#chat_canvas').scrollTop(document.getElementById("chat_canvas").scrollHeight - currHeight);

}


function getUrlVars() {
  var vars = [], hash;
  var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
  for(var i = 0; i < hashes.length; i++) {
    hash = hashes[i].split('=');
    vars.push(hash[0]);
    vars[hash[0]] = hash[1];
  }
  return vars;
}