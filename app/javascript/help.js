
import jquery from "jquery"
import "bootstrap"
window.$ = jquery

$(function(){
  $("#help_btn").click(function(){
    open_popup();
  });

  document.querySelectorAll(
    '[data-bs-toggle="popover"]:not(#mouse_over)'
  ).forEach(el => {
    new window.bootstrap.Popover(el);
  });

  const mouseOver = document.getElementById('mouse_over');

  if (mouseOver) {
    const popover = new window.bootstrap.Popover(mouseOver, {
      trigger: 'manual'
    });

    $(mouseOver).hover(function() {
      $(this).css('background', '#c00');
      popover.show();
    }, function() {
      $(this).css('background', '');
      popover.hide();
    });
  }
});

function open_popup(){
  var pop_title = "HELP";
  var url = "/help";
  var location_str = 'height=600,width=800,top=10,left=10';

  var help_window = window.open(url, pop_title, location_str);
  if (help_window) help_window.focus();

  window.onstorage = message_receive;

  return false;
}

function message_receive(event) {
  if (event.key != 'message') return;
  var message = JSON.parse(event.newValue);
  if (!message) return;

  if (message.command == 'inquire') {
    window.focus();
    var inq_number = message.inq_number;

    if (inq_number == 1) {
      const request = new XMLHttpRequest();
      request.open('GET', '/', true);
      request.send(null);

      request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200) {
          var data = request.responseText;
          document.open();
          document.write(data);
          document.close();
          history.replaceState('', '', '/');
        }
      }
    }
    else if (inq_number == 2) {
      $('<div>', {'text': 'New Element from HELP'}).appendTo("#messages");
    }
  }
}
