class Application.Views.Dataset extends Backbone.View
  
  template: Application.Templates.dataset
  tagName: "div"
  className: "dataset"
  
  events: 
    "click .remove_dataset": "removeDataset"
    "change input": "update"
    "change .title": "renameDataset"
    "change .expanded_fields": "addExpanded"

  render: =>
    @$el.html @template @model.toJSON(), schema: Application.schema
    @model.fields.forEach (field) =>
      @$el.find('.fields').append field.view.el
      field.view.render()
    @
    
  removeDataset: (e) ->
    e.preventDefault()
    if confirm "Are you sure you would like to remove this dataset?"
      @model.destroy()
      @remove()
    false
  
  renameDataset: (e) ->
    @render()

  update: (e) ->
    field = @$(e.target)
    @model.set field.data('field'), field.val()

  addExpanded: (e) ->
    select = $(e.target)
    @model.fields.add( Application.schema.get( select.val() ).toJSON() )
    select.children("option:selected").remove()
    select.parent().parent().remove() if select.children().length == 1

  initialize: ->
    @model.fields.on "add", @addField
    @model.on 'add', @render

  addField: (field) =>
    field.view.dataset = @model
    @$el.find('.fields').append field.view.el
    field.view.render()
    
