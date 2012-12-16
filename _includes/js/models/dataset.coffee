class Application.Models.Dataset extends Backbone.Model
  
  defaults: ->
    hash = {}
    Application.Schema.basic.forEach (field) =>
      hash[field.get 'json'] = null
    hash.title = 'Dataset'
    hash

class Application.Collections.Datasets extends Backbone.Collection
  model: Application.Models.Dataset
  
  getJSON: ->
  
  getHTML: ->
  
  getXML: ->