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

  types: []

  constructor: ->
    $.ajax 'schema.yml', success: @initFields, async: false
  
  initFields: (data) =>
    for type, fields of jsyaml.load data
      @types.push type if $.inArray( type, @types ) == -1
      @[type] = new Application.Collections.Fields()
      @[type].import fields

  #Return an instance of a field by json name
  get: (field) ->
    _.clone _.first @all().where "json": field

  #return all fields
  all: ->
    all = new Application.Collections.Fields()
    all.add @[type].toJSON() for type in @types
    all