class Application.Models.Field extends Backbone.Model
  defaults:
    definition: "",
    json: "",
    name: "",
    rdfa: "",
    type: "text",
    value: ""
    
class Application.Collections.Fields extends Backbone.Collection
  model: Application.Models.Field