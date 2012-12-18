class Application.Views.UploadView extends Backbone.View
  el: '#main'
  template: $('#upload_template').html()
  
  events: 
    "change input": "selectFile"
    "dragover #drop_zone": "dragOver"
    "dragleave #drop_zone": "dragOut"
    "drop #drop_zone": "drop"
  
  initialize: ->  
    jQuery.event.props.push('dataTransfer');
    
    if !@canHazFile()
      @template = '<p>Your browser is not supported. Please consider <a href="http://browsehappy.com/">upgrading</a>.'
      
  render: ->
    compiled = _.template @template
    @$el.html compiled( )   
  
  canHazFile: ->
    if !window.File? || !window.FileReader? || !window.FileList? || !window.Blob?
      return false
    true
  
  selectFile: (e) ->
    @read e.target.files[0]
    
  dragOver: (e) ->
    e.stopPropagation()
    e.preventDefault()
    e.dataTransfer.dropEffect = 'copy'
    $('#drop_zone').addClass 'hover'
    false
    
  dragOut: (e) ->
    e.stopPropagation()
    e.preventDefault()
    $('#drop_zone').removeClass 'hover'
    false
        
  drop: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @read e.dataTransfer.files[0]
    $('#drop_zone').removeClass 'hover'
    false
    
  read: (file) ->
    reader = new FileReader()
    reader.onload = (file) =>
      data = @parseFile file.target.result
      view = new Application.Views.ImportView collection: data
      view.render()
      Application.Router.navigate 'import'
    reader.readAsText file
    
  parseFile: (file) ->
    try #attempt a JSON
      data = JSON.parse file
    catch error #attempt as CSV
      data = $.csv.toObjects file
    finally
      return data
        