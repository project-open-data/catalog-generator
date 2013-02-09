class Application.Views.Field extends Backbone.View
  tagName: 'div'
  className: 'field'
  template: Application.Templates.field
  
  input: =>
    Application.Templates[ "fields/" + @model.get('type')]

  render: ->
    console.log  @dataset.toJSON()
    @$el.html @template dataset: @dataset.toJSON(), field: @input(), model: @model.toJSON(), value: @dataset.get( @model.get( 'json' ) ) 