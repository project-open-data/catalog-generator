class Application.Views.Import extends Backbone.View
  el: '#content'
  template: Application.Templates.import
  
  events: 
    "click #import": "import"
    
  render: ->
    schema = Application.schema.basic.toJSON() #todo: add extended via concat()
    @$el.html @template( schema: schema, fields: @getFields() )
    
  getFields: ->
    fields = []
    $.each @collection, (k, row) ->
      $.each row, (field, value) ->
        fields.push field if $.inArray( field, fields ) == -1
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
    