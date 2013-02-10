class Application.Views.Index extends Backbone.View
  template: Application.Templates.index
  el: '#content'
  
  events: 
    "click #add_dataset": "add"
       
  render: ->
    @$el.html @template()
    @collection.forEach (dataset) =>
      @addDataset dataset

  addDataset: (dataset) =>
    @$('.datasets').append dataset.view.el    

  initialize: ->
    @collection.on 'add', @addDataset

    @add() if @collection.size() == 0

    @render()

  add: ->
    @collection.add {}