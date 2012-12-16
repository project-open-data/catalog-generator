class Application.Views.FieldView extends Backbone.View
  el: '.fields'
  tagName: 'div'
  class: 'field'
  template: $('#field_template').html()
  
  input: ->
    $('#' + @model.get('type') + '_template').html()

  render: ->
    rendered = _.template @template
    field = _.template @input()
    @$el.append rendered model: @model.toJSON(), field: field