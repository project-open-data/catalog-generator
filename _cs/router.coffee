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

  initialize: ->
    Backbone.history.on 'route', @setActiveTab

  setActiveTab: ->
    $(".nav .active").removeClass "active"
    tab = Backbone.history.fragment || "home"
    $(".nav ." + tab).addClass "active"
  
Application.Router = new Router()
