class Application.Views.IndexView extends Backbone.View
  template: $('#index_template').html()
  el: '#main'
  
  events: 
    "click #add_dataset": "addDataset"
       
  render: =>
    @$el.html @template
    @collection.forEach (dataset) ->
      view = new Application.Views.DatasetView model: dataset
      view.render()
  
  addDataset: ->
    @collection.add new Application.Models.Dataset()
    
  initialize: ->
    @collection.on 'add', @render
    @addDataset() if @collection.size() == 0
