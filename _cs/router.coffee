class Router extends Backbone.Router
  routes:
    "": "index"
    "upload": "upload"
    "import": "import"
    "export": "export"
    
  index: ->
    view = new Application.Views.Index( collection: Application.datasets )
    view.render()
  
  upload: ->
    view = new Application.Views.Upload()
    view.render()
   
  import: ->
    @navigate 'upload', true
   
  export: ->
    view = new Application.Views.Export collection: Application.datasets
    view.render()
   
Application.Router = new Router()
