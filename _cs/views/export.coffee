class Application.Views.Export extends Backbone.View
  el: '#content'
  template: Application.Templates.export
  events:
    "focus .copy_zone": "select"
    "mouseup .copy_zone": "preventDefault"
  
  render: ->
    @$el.html @template json: @collection.getJSON(), xml: @collection.getXML(), html: @collection.getHTML() 
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
        $( "#" + $(@.el).attr( "data-type" ) ).val()
      
      