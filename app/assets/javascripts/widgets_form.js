
$(function() {
  var $widgetType = $('#widget_widget_type_id');
  // var $content = $('#widget_content_input');
  // var $summary = $('#widget_summary_input');
  var $visualization = $('#widget_visualization_input');
  var $dataset = $('#widget_dataset_input');
  var inputs = [$visualization, $dataset];

  setWidgetForm();

  $widgetType.on('change', function() {
    setWidgetForm();
  });

  function setWidgetForm() {
    // Value 2 is type 'Embed'
    if ($widgetType.val() === "2" ) {
      inputs.forEach(function(input) {
        input.css({
          visibility: 'hidden',
          position: 'absolute',
          top: '-1000px'
        });
      });
    } else {
      inputs.forEach(function(input) {
        input.css({
          visibility: 'visible',
          position: 'inherit',
          top: '0'
        });
      });
    }
  }
});
