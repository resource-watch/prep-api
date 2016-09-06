(function(App) {

  App.View.DatasetSelector = Backbone.View.extend({

    events: {
      'change': 'triggerChange'
    },

    initialize: function() {
      this.$el.select2({width: '80%'});
    },

    triggerChange: function() {
      this.trigger('change', this.getState());
    },

    getState: function() {
      return {
        datasetId: this.el.options[this.el.selectedIndex].value
      };
    }

  });

})(this.App);
