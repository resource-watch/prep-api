(function(App) {

  App.View.VisualisationSelector = Backbone.View.extend({

    events: {
      'change': 'triggerChange'
    },

    initialize: function() {
      this.$el.select2({width: '80%'});
      this.widgets = new App.Collection.Widgets();
      this.widgets.on('reset sync', this.render.bind(this));
      if (this.el && this.el.options.length <= 1) {
        this.$el.prop('disabled', true);
      }
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
      if (!this.el) {
        return { widgetId: null };
      }
      return {
        widgetId: this.el.options[this.el.selectedIndex].value
      };
    },

    render: function() {
      this.$el.empty();
      this.$el.prop('disabled', true);
      this.$el.append(new Option('-- Select an option --', ''));
      this.widgets.each(function(widget) {
        var data = widget.attributes;
        var optionElement = new Option(data.attributes.name, data.id);
        this.$el.append(optionElement);
      }.bind(this));
      if (this.widgets.length > 0) {
        this.$el.prop('disabled', false);
      }
    }

  });

})(this.App);
