//This makes the description field autosize to the size of the text content
var observe = function (element, event, handler) {
  $(window).bind(event, handler);
};

function initTextArea () {
  var $text = $('#organization_description');
  function resize () {
    $text.height( 'auto' );
    var textareas = $('textarea');
    if(textareas.length) {
      $text.height(textareas[0].scrollHeight);
    }
  }
  /* 0-timeout to get the already changed text */
  function delayedResize () {
    window.setTimeout(resize, 0);
  }
  observe($text, 'change',  resize);
  observe($text, 'cut',     delayedResize);
  observe($text, 'paste',   delayedResize);
  observe($text, 'drop',    delayedResize);
  observe($text, 'keydown', delayedResize);
  resize();
}
