class Application.Views.ImportView extends Backbone.View
  el: '#main'
  template: $('#import_template').html()
  
  events: 
    "click #import": "import"
    
  render: ->
    schema = Application.Schema.basic.toJSON() #todo: add extended via concat()
    compiled = _.template @template
    @$el.html compiled( schema: schema, fields: @getFields() )
    
  getFields: ->
    fields = []
    $.each @collection, (k, row) ->
      $.each row, (field, value) ->
        fields.push field if $.inArray field, fields == -1
    fields
    
  import: ->
    $.each @collection, (k, row) =>
      dataset = new Application.Models.Dataset()
      $.each row, (field, value) =>
        map = @map field
        return if !map
        dataset.set map, value
      Application.datasets.add dataset
    Application.Router.navigate '', true
    
  map: (field) ->
    $("#map\\[" + field + "\\]").val()
    