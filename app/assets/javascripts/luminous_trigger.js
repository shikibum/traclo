document.addEventListener("DOMContentLoaded", function () {
  var luminousTriggers = document.querySelectorAll('.luminous');
  for (var i = 0; i < luminousTriggers.length; i++) {
    new Luminous(luminousTriggers[i]);
  }
});
