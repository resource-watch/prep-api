'use strict';

(function(window) {
  function onReady() {
    var q = document.getElementById('widget_dataset');
    console.log(q.options[q.selectedIndex].value);
  }

  document.addEventListener('DOMContentLoaded', onReady);
})(window);
