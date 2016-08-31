(function(App) {

  App.View.DatasetSelector = Backbone.View.extend({

    events: {
      'change': 'triggerChange'
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
