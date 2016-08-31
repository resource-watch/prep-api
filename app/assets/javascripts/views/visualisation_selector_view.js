(function(App) {

  App.View.VisualisationSelector = Backbone.View.extend({

    events: {
      'change': 'triggerChange'
    },

    initialize: function() {
      this.widgets = new App.Collection.Widgets();
      this.widgets.on('reset sync', this.render.bind(this));
    },

    fetchOptions: function(state) {
      var params = { app: 'prep', dataset: state.datasetId };
      if (!state.datasetId) {
        this.widgets.reset();
      } else {
        this.widgets.fetch({data: params});
      }
    },

    triggerChange: function() {
      this.trigger('change', this.getState());
    },

    getState: function() {
      return {
        widgetId: this.el.options[this.el.selectedIndex].value
      };
    },

    render: function() {
      this.$el.empty();
      this.$el.append(new Option('', ''));
      this.widgets.each(function(widget) {
        var data = widget.attributes;
        var optionElement = new Option(data.attributes.name, data.id);
        this.$el.append(optionElement);
      }.bind(this));
    }

  });

})(this.App);
