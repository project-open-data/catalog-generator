class Application.Models.Dataset extends Backbone.Model
  
  defaults: ->
    hash = {}
    Application.schema.basic.forEach (field) =>
      hash[field.get 'json'] = null
    hash
    
  initialize: ->
    @on "change:public", @validatePublic
    @fields = new Application.Collections.Fields()
    @view = new Application.Views.Dataset model: @
    for field, value of @attributes
      @fields.add Application.schema.get(field).toJSON()

  # force "public" value to be a bool, rather than a truthy string
  validatePublic: ->
    @set "public", !!@get("public"), silent: true

class Application.Collections.Datasets extends Backbone.Collection
  model: Application.Models.Dataset
  
  getJSON: ->
    JSON.stringify @toJSON()
  
  getHTML: ->
    "<div class=\"datasets\">\n" + @getTemplated('html') + "</div>\n"
    
  getXML: ->
    "<datasets>\n" + @getTemplated('xml') + "</datasets>\n"
  
  getTemplated: (type) ->
    output = ''
    template = Application.Templates[type]
    @.each (dataset) ->
      output += template schema: Application.schema, dataset: dataset.toJSON()
    output