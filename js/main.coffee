class catalogGenerator

  data: []
  fields: {}
  
  constructor: ->
    $('#add_dataset').click @addDataset
    $('.remove_dataset').live 'click', @removeDataset
    $('.add_multiple').live 'click', @addMultiple
    $('#title').live 'change', @renameDataset

    $.ajax 'schema.yml', 
      success: (data) =>
        @fields = jsyaml.load data
        @addDataset()

  addDataset: =>
    $('#datasets').append $('#dataset_template').html() 
    @renderFields $('.dataset').last()
    
  removeDataset: ->
    if confirm "Are you sure?"
      $(@).parent().remove()
  
  renameDataset: ->
    $(@).parent().parent().parent().parent().children('h3').html $(@).val()
    
  renderFields: (dataset) ->
    $.each @fields.basic, (k,field) =>
      field = @parseType field
      input = @getInput field
      $(dataset).children('.fields').append Mustache.render( $('#field_template').html(), field, input: input )
  
  parseType: (field) ->
    field.type = "text" unless field.type?
    field
  
  getInput: (field) ->
    $( '#' + field.type + '_template' ).html()
    
  addMultiple: ->
    $(@).siblings('input').last().clone().appendTo $(@).parent()
    
  getArray: ->
    @data = []
    $.each $('.dataset'), (k, dataset ) =>
      values = {}
      $.each @fields.basic, (k,field) =>
        key = field.json
        value = $(dataset).find('#'+field.json).val() 
        values[key] = value
      @data.push values
    @data
  
  getJSON: ->
    JSON.stringify @getArray()
    
  
    

jQuery(document).ready ($) ->
  window.catalogGenerator = new catalogGenerator()