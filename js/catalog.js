---
layout: nil
---

window.Application = {
  Models: {},
  Views: {},
  Router: {},
  Collections: {},
  Fields: {}
};

//libraries
{% include js/vendor/underscore.js %}
{% include js/vendor/backbone.js %}
{% include js/vendor/yaml.min.js %}

//application
{% include js/views/index.js %}
{% include js/views/import.js %}
{% include js/views/export.js %}
{% include js/views/dataset.js %}
{% include js/views/field.js %}
{% include js/models/field.js %}
{% include js/models/dataset.js %}
{% include js/router.js %}
{% include js/importSchema.js %}

/*{% include js/app.js %}*/

//start router
Backbone.history.start({pushstate: true});
