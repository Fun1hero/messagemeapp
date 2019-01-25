// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .

scroll_bottom = function() {
  if ($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}

submit_message = function() {
  $('#message_body').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('button').click();
      e.target.value = "";
    };
  });
};
  // $('#message_body').keydown(function(event) {
  //   if (event.keyCode == 13 && event.shiftKey) {
  //     var content = this.value;
  //     var caret = getCaret(this);
  //     this.value = content.substring(0, caret) + "\n" + content.substring(carent, content.length - 1);
  //     event.stopPropagation();
  //   } else if (event.keyCode == 13) {
  //     $('button').click();
  //   }
  // });
  //}

// function getCaret(el) {
  // if (el.selectionStart) {
  //   return el.selectionStart;
  // } else if (document.selection) {
  //   el.focus();
  //   var r = document.selection.createRange();
  //   if (r == null) {
  //     return 0;
  //   }
  //   var re = el.createTextRange(),
  //     rc = re.duplicate();
  //   re.moveToBookmark(r.getBookmark());
  //   rc.setEndPoint('EndToStart', re);
  //   return rc.text.length;
  // }
  // return 0;
//}

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  submit_message();
  scroll_bottom();
})
