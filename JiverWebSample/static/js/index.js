/**
 * Created by James on 15. 9. 18..
 */

var userNickName = null;
var createChannelUrl = null;
var createChannelTopic = null;
var jiverAPI = null;
var apiToken = '093638967186b4584ea9a2afab0ad54664a4a902'; // Sample JIVER app api_token

$(document).ready(function() {

  init();

  $('#nick_name').keyup(function(e) {

    userNickName = $('#nick_name').val();
    if (userNickName == null || userNickName == undefined || userNickName.replace(/ /gi, '').length == 0) {
      $('#btn_open_chat_list').prop('disabled', true);
      $('#btn_start_msg_chat').prop('disabled', true);
      $('#btn_Msg_Chat_List').prop('disabled', true);
    } else {
      $('#btn_open_chat_list').prop('disabled', false);
      $('#btn_start_msg_chat').prop('disabled', false);
      $('#btn_Msg_Chat_List').prop('disabled', false);
    }

  });

  $('#btn_open_chat_list').click(function() {
    window.location.href = 'open-chat.html?nickname=' + encodeURI(encodeURIComponent(userNickName));
  });

  $('#btn_start_msg_chat').click(function() {
    window.location.href = 'msg-chat.html?nickname=' + encodeURI(encodeURIComponent(userNickName)) + '&type=start';
  });

  $('#btn_Msg_Chat_List').click(function() {
    window.location.href = 'msg-chat.html?nickname=' + encodeURI(encodeURIComponent(userNickName)) + '&type=list';
  });


  $('#channel_url').keyup(function(e) {

    createChannelUrl = $('#channel_url').val();
    createChannelTopic = $('#channel_topic').val();
    if ((createChannelUrl == null || createChannelUrl == undefined || createChannelUrl.replace(/ /gi, '').length == 0)
     || (createChannelTopic == null || createChannelTopic == undefined || createChannelTopic.replace(/ /gi, '').length == 0)) {
      $('#btn_create_channel').prop('disabled', true);
    } else {
      $('#btn_create_channel').prop('disabled', false);
    }

  });

  $('#channel_topic').keyup(function(e) {

    createChannelUrl = $('#channel_url').val();
    createChannelTopic = $('#channel_topic').val();
    if ((createChannelUrl == null || createChannelUrl == undefined || createChannelUrl.replace(/ /gi, '').length == 0)
     || (createChannelTopic == null || createChannelTopic == undefined || createChannelTopic.replace(/ /gi, '').length == 0)) {
      $('#btn_create_channel').prop('disabled', true);
    } else {
      $('#btn_create_channel').prop('disabled', false);
    }

  });

  $('#btn_create_channel').click(function() {
    jiverAPI = new JiverAPI(apiToken);
    var channelInfo = jiverAPI.channel.create(createChannelUrl, createChannelTopic);

    if (channelInfo['error'] == true) {
      createChannelUrl = $('#channel_url').val('');

      alert(channelInfo['message']);

      console.log(createChannelUrl, createChannelTopic);
    } else {
      createChannelUrl = $('#channel_url').val('');
      createChannelTopic = $('#channel_topic').val('');

      alert('success!!\nChannel Url : ' + channelInfo['channel_url'] + '\nChannel Name : ' + channelInfo['name']);

      console.log(channelInfo);
    }

  });
});

function init() {
  $('#nick_name').val('');

  $('#btn_open_chat_list').prop('disabled', true);
  $('#btn_start_msg_chat').prop('disabled', true);
  $('#btn_Msg_Chat_List').prop('disabled', true);

  $('#btn_create_channel').prop('disabled', true);

  $('#nick_name').focus();
}