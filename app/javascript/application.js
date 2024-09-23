// = require jquery
// = require bootstrap
// = require jquery_ujs
// = require_tree .
// import "bootstrap"
// import "@popperjs/core"
// import "controllers"

// import { Turbo } from "@hotwired/turbo-rails"
window.addEventListener('pageshow', function (event) {
  var historyTraversal =
    event.persisted ||
    (typeof window.performance != 'undefined' &&
      window.performance.navigation.type === 2);
  if (historyTraversal) {
    // Handle page restore.
    window.location.reload();
  }
});

$(document).on('change', '.image-upload', function (e) {
  var input = e.target;
  var preview = $(input).closest('.image').find('.preview-image');

  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      preview.attr('src', e.target.result).show();
      preview.css({width: '150px', height: '150px'});
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    preview.hide();
  }
});
