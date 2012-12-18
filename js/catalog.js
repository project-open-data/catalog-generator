---
layout: nil
---

window.Application = {
  Models: {},
  Views: {},
  Router: {},
  Collections: {},
  Fields: {},
  datasets: {},
  url: '{{ site.url }}'
};

//libraries
{% include js/vendor/underscore.js %}
{% include js/vendor/backbone.js %}
{% include js/vendor/yaml.min.js %}
{% include js/vendor/jquery.csv.js %}
{% include js/vendor/swfobject.js %}
{% include js/vendor/downloadify.min.js %}

//application
{% include js/views/index.js %}
{% include js/views/import.js %}
{% include js/views/upload.js %}
{% include js/views/export.js %}
{% include js/views/dataset.js %}
{% include js/views/field.js %}
{% include js/models/field.js %}
{% include js/models/dataset.js %}
{% include js/router.js %}
{% include js/importSchema.js %}

//init collection
Application.datasets = new Application.Collections.Datasets()

//start router
Backbone.history.start()