class Application.Views.Field extends Backbone.View
  el: '.fields'
  tagName: 'div'
  class: 'field'
  template: Application.Templates.field
  
  input: =>
    Application.Templates[ "fields/" + @model.get('type')]

  render: ->
    @$el.append @template model: @model.toJSON(), field: @input @model.toJSON()