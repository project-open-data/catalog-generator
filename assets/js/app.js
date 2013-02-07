---
layout: nil
---

{% include js/vendor/bootstrap.js %}
{% include js/vendor/underscore.js %}
{% include js/vendor/backbone.js %}
{% include js/vendor/jquery.csv.js %}
{% include js/vendor/swfobject.js %}
{% include js/vendor/downloadify.min.js %}
{% include js/vendor/yaml.min.js %}

window.Application = {
  Models: {},
  Collections: {},
  Views: {},
  Router: {},
  Templates: {}
};
{% include js/templates.js %}
{% include js/app.js %}

Application.schema = new Application.Collections.Schema()
Application.datasets = new Application.Collections.Datasets()

Backbone.history.start({ pushState: false, root: "{{ site.root }}" });