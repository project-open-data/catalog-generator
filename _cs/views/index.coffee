class Application.Views.Index extends Backbone.View
  template: Application.Templates.index
  el: '#content'
  
  events: 
    "click #add_dataset": "addDataset"
       
  render: =>
    @$el.html @template()
    @collection.forEach (dataset) ->
      view = new Application.Views.Dataset model: dataset
      view.render()
  
  addDataset: ->
    @collection.add new Application.Models.Dataset()
    
  initialize: ->
    @collection.on 'add', @render
    @addDataset() if @collection.size() == 0
