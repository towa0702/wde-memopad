import jquery from "jquery"
window.$ = jquery

$(function(){
  $("#inquire_btn").click(function(){
    inquire();
  });
});

function inquire() {
  var inq_number = $("[name=inq_number]").val();
  message_broadcast({'command': 'inquire', 'inq_number': inq_number});
  window.close();
  return false;
}

function message_broadcast(message) {
  localStorage.setItem('message', JSON.stringify(message));
  localStorage.removeItem('message');
}