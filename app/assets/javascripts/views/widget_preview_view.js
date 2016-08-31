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
      var vegaSpec = data.attributes.widgetConfig || {};

      vegaSpec.width = this.$el.width();

      // Creating chart using Vega
      vg.parse.spec(vegaSpec, function(chart) {
        var chartVis = chart({ el: this.el });
        chartVis.update();
      }.bind(this));
    }

  });

})(this.App);
