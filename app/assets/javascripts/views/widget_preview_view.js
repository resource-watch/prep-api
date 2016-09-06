(function(App) {

  App.View.WidgetPreview = Backbone.View.extend({

    fetchWidget: function(state) {
      this.$el.empty();
      this.widget = new App.Model.Widget({id: state.widgetId});
      this.widget.fetch().done(function() {
        this.render();
        this.triggerLoaded();
      }.bind(this));
    },

    triggerLoaded: function() {
      this.trigger('loaded', this.getState());
    },

    getState: function() {
      return this.widget ? this.widget.attributes : {};
    },

    render: function() {
      if (Object.keys(this.widget.attributes).length === 0) {
        return this.$el.empty();
      }
      var data = this.widget.attributes;
      var widgetSpec = data.attributes.widgetConfig || {};

      if (data.type === 'embed') {
        this.renderIframe(widgetSpec);
      } else if (data.type === 'map') {
        this.renderMap(widgetSpec);
      } else {
        this.renderChart(widgetSpec);
      }
    },

    renderIframe: function(widgetSpec) {
      // TODO
    },

    renderMap: function(widgetSpec) {
      // TODO
    },

    // Creating chart using Vega
    renderChart: function(widgetSpec) {
      widgetSpec.width = this.$el.width();
      vg.parse.spec(widgetSpec, function(chart) {
        var chartVis = chart({ el: this.el });
        chartVis.update();
      }.bind(this));
    }

  });

})(this.App);
