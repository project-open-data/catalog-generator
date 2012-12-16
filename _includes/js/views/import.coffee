class Application.Views.ImportView extends Backbone.View
  el: '#main'
  template: $('#import_template').html()
  
  render: ->
    compiled = _.template @template
    @$el.html compiled( ) 