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

