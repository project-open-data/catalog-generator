class Application.Models.Field extends Backbone.Model
  defaults:
    definition: "",
    json: "",
    name: "",
    rdfa: "",
    type: "text",
    value: ""
 
  initialize: ->
    @view = new Application.Views.Field model: @

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

  get: (field) ->
    model = @basic.where "json": field
    model = @expanded.where "json": field unless model
    _.clone model