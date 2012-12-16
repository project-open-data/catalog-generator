class importSchema
  data: $('#schema').html()
  basic: new Application.Collections.Fields()
  extended: new Application.Collections.Fields()
  
  constructor: ->
    @schema = jsyaml.load @data
    @import 'basic', @schema.basic
   #@import 'extended', @schema.extended
      
  import: (type, fields) ->
    $.each fields, (k, field) =>
      model = new Application.Models.Field field
      this[type].add model
    
Application.Schema = new importSchema();
