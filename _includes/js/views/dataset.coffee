class Application.Views.DatasetView extends Backbone.View
  
  template: $('#dataset_template').html()
  el: '#datasets'
  tagName: "div"
  className: "dataset"
  id: "datasets"
  attributes: { foo: "bar"}
  
  events: 
    "click .remove_dataset": "removeDataset"
    "change input": "update"
    
  render: ->
    compiled = _.template @template
    @$el.append compiled( @model.toJSON() ) 
    @renderFields()
    @
    
  removeDataset: ->
    if confirm "Are you sure?"
      @remove()
  
  renameDataset: ->
    $(@).parent().parent().parent().parent().children('h3').html $(@).val()
    
  renderFields: ->
    Application.Schema.basic.forEach (field) =>
      field.set 'value', @model.get field.get('json')
      view = new Application.Views.FieldView model: field
      view.render()  

  update: (e) ->
    console.log $(e.target).n()