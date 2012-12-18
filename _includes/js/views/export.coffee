class Application.Views.ExportView extends Backbone.View
  el: '#main'
  template: $('#export_template').html()
  events:
    "focus .copy_zone": "select"
    "mouseup .copy_zone": "preventDefault"
  
  render: ->
    compiled = _.template @template
    @$el.html compiled json: @collection.getJSON(), xml: @collection.getXML(), html: @collection.getHTML() 
    @initDownload()
    
  select: (e) ->
    e.target.select()
  
  preventDefault: (e) ->
    e.preventDefault
    e.stopPropegation
    false
    
  initDownload: ->
    $( ".download" ).downloadify
      swf: Application.url + "/swf/downloadify.swf"
      downloadImage: Application.url + "/img/download.png"
      filename: ->
       "data." + $(@.el).attr("data-type")
      data: ->
        $( "#" + $(@.el).attr( "data-type" ) ).html()
      
      