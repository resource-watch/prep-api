(function(App) {

  function updateForm(data) {
    form = document.getElementById('widget_form');
    for (var i = 0, formLength=form.elements.length; i < formLength; i++) {
      var input = form.elements[i];
      switch (input.name) {
        case 'widget[title]':
          input.value = data.attributes && data.attributes.name ? data.attributes.name : '';
          break;
        case 'widget[slug]':
          input.value = data.attributes && data.attributes.slug ? data.attributes.slug : '';
          break;
        case 'widget[summary]':
          input.value = data.attributes && data.attributes.description ? data.attributes.description : '';
          break;
        case 'widget[attribution]':
          input.value = data.attributes && data.attributes.authors ? data.attributes.authors : '';
          break;
        case 'widget[data_url]':
          input.value = data.attributes && data.attributes.queryUrl ? data.attributes.queryUrl : '';
          break;
        case 'widget[widget_config]':
          input.value = data.attributes && data.attributes.widgetConfig ? JSON.stringify(data.attributes.widgetConfig) : '';
          break;
        default:
          break;
      }
    }
  }

  document.addEventListener('DOMContentLoaded', function() {
    // Widget create and edit
    var datasetSelector = new App.View.DatasetSelector({
      el: '#widget_dataset'
    });
    var visualisationSelector = new App.View.VisualisationSelector({
      el: '#widget_visualization'
    });
    var widgetPreview = new App.View.WidgetPreview({
      el: '#widget-preview'
    });

    var initialVisState = visualisationSelector.getState();

    datasetSelector.on('change', function(state) {
      visualisationSelector.fetchOptions(state);
    });

    visualisationSelector.on('change', function(state) {
      widgetPreview.fetchWidget(state);
    });

    widgetPreview.on('loaded', function(state) {
      updateForm(state);
    });

    // Preview at begining if visualisation exits
    if (initialVisState.widgetId && initialVisState.widgetId !== '') {
      widgetPreview.fetchWidget(initialVisState);
    }

    // Multiple select with select2
    $('select[multiple]').select2({ width: '70%' });
  });

})(this.App)
