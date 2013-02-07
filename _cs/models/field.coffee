class Application.Models.Field extends Backbone.Model
  defaults:
    definition: "",
    json: "",
    name: "",
    rdfa: "",
    type: "text",
    value: ""
    
class Application.Collections.Fields extends Backbone.Collection
  model: Application.Models.Field
      
  import: (fields) ->
    _.each fields, (field) =>
      @add new Application.Models.Field field

class Application.Collections.Schema

  constructor: ->
    $.ajax 'schema.yml', success: @initFields, async: false
  
  initFields: (data) =>
    for type, fields of jsyaml.load data
      @[type] = new Application.Collections.Fields()
      @[type].import fields
