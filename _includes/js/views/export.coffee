class Application.Views.ExportView extends Backbone.View
  el: '#main'
  template: $('#export_template').html()
  
  render: ->
    compiled = _.template @template
    @$el.html compiled json: @collection.getJSON(), xml: @collection.getXML(), html: @collection.getHTML() 