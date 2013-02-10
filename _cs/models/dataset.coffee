class Application.Models.Dataset extends Backbone.Model
  
  defaults: ->
    hash = {}
    Application.schema.basic.forEach (field) =>
      hash[field.get 'json'] = null
    hash
    
  initialize: ->
    @fields = new Application.Collections.Fields()
    @view = new Application.Views.Dataset model: @
    for field, value of @attributes
      @fields.add Application.schema.get(field).toJSON()

class Application.Collections.Datasets extends Backbone.Collection
  model: Application.Models.Dataset
  
  getJSON: ->
    JSON.stringify @toJSON()
  
  getHTML: ->
    @getTemplated 'html'
    
  getXML: ->
    "<datasets>\n" + @getTemplated('xml') + "</datasets>\n"
  
  getTemplated: (type) ->
    output = ''
    template = Application.Templates[type]
    @.each (dataset) ->
      output += template schema: Application.schema.basic.toJSON(), dataset: dataset.toJSON()
    output