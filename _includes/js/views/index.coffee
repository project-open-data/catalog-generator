class Application.Views.IndexView extends Backbone.View
  template: $('#index_template').html()
  el: '.container'
  
  events: 
    "click #add_dataset": "addDataset"
       
  render: ->
    @$el.html @template
    @addDataset()
  
  addDataset: ->
    view = new Application.Views.DatasetView model: new Application.Models.Dataset()
    view.render()
    false