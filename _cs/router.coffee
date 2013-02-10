class Router extends Backbone.Router
  routes:
    "": "index"
    "upload": "upload"
    "import": "import"
    "export": "export"
    
  index: ->
    new Application.Views.Index( collection: Application.datasets ).render()

  upload: ->
    new Application.Views.Upload().render()
   
  import: ->
    @navigate 'upload', true
   
  export: ->
    new Application.Views.Export( collection: Application.datasets).render()
   
Application.Router = new Router()
