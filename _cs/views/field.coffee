class Application.Views.Field extends Backbone.View
  tagName: 'div'
  className: 'field'
  template: Application.Templates.field
  
  input: =>
    Application.Templates[ "fields/" + @model.get('type')]

  render: ->
    input = @input()
    data = @model.toJSON()
    data.value = @dataset.get( @model.get( 'json' ) )
    @$el.html @template dataset: @dataset.toJSON(), field: input(data), model: @model.toJSON()