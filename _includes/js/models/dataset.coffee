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
    JSON.stringify @toJSON()
  
  getHTML: ->
    @getTemplated 'html'
    
  getXML: ->
    "<datasets>\n" + @getTemplated('xml') + "</datasets>\n"
  
  getTemplated: (type) ->
    output = ''
    compiled = _.template $('#' + type + '_template').html()
    @.each (dataset) ->
      output += compiled schema: Application.Schema.basic.toJSON(), dataset: dataset.toJSON()
    output