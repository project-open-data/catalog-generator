class Application.Views.Index extends Backbone.View
  template: Application.Templates.index
  el: '#content'
  
  events: 
    "click #add_dataset": "add"
       
  render: ->
    @$el.html @template()
  
  addDataset: (dataset) =>
    @$('.datasets').append dataset.view.el    

  initialize: ->
    @render()
    
    @collection.on 'add', @addDataset

    @add() if @collection.size() == 0

  add: ->
    @collection.add {}