class Router extends Backbone.Router
  routes:
    "": "index"
    "import": "import"
    "export": "export"
    
  index: ->
   view = new Application.Views.IndexView()
   view.render()
  
  import: ->
   view = new Application.Views.ImportView()
   view.render()
   
  export: ->
   datasets = new Application.Collections.Datasets()
   view = new Application.Views.ExportView()
   view.render( collection: datasets )
   
Application.Router = new Router()
