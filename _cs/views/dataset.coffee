class Application.Views.Dataset extends Backbone.View
  
  template: Application.Templates.dataset
  tagName: "div"
  className: "dataset"
  
  events: 
    "click .remove_dataset": "removeDataset"
    "change input": "update"
    "click .add_multiple": "addMultiple"
    "change .title": "renameDataset"
    "click .add_expanded": "addExpanded"

  render: =>
    @$el.html @template @model.toJSON()
    @model.fields.forEach (field) ->
      @$('.fields').append field.view.el
      field.view.render()
    @
    
  removeDataset: ->
    if confirm "Are you sure?"
      @model.destroy()
      @remove()
  
  renameDataset: (e) ->
    @render()

  update: (e) ->
    field = @$(e.target)
    @model.set field.data('field'), field.val()

  addMultiple: ->
    @$.siblings('input').last().clone().appendTo $(@).parent()

  addExpanded: ->

  initialize: ->
    @model.fields.on "add", @addField
    @model.on 'all', @render

  addField: (field) =>
    field.view.dataset = @model
    @$('.fields').append field.view.el
    
