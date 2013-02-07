class Application.Views.Dataset extends Backbone.View
  
  template: Application.Templates.dataset
  el: '#datasets'
  tagName: "div"
  className: "dataset"
  id: "datasets"
  attributes: { foo: "bar"}
  
  events: 
    "click .remove_dataset": "removeDataset"
    "change input": "update"
    "click .add_multiple": "addMultiple"
    "change .title": "renameDataset"
    "click .add_expanded": "addExpanded"

  render: ->
    @$el.append @template @model.toJSON()
    @renderFields()
    @
    
  removeDataset: ->
    if confirm "Are you sure?"
      @remove()
  
  renameDataset: (e) ->
    @$el.children('h3').html $(e.target).val()
    
  renderFields: ->
    Application.schema.basic.forEach (field) =>
      field.set 'value', @model.get field.get('json')
      view = new Application.Views.Field model: field
      view.render()  

  update: (e) ->

  addMultiple: ->
    @$.siblings('input').last().clone().appendTo $(@).parent()

  addExpanded: ->