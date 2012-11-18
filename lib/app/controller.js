// Generated by CoffeeScript 1.3.3
(function() {
  var Controller,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Controller = (function() {

    function Controller(selector, model) {
      var _this = this;
      this.selector = selector;
      this.model = model;
      this.start = __bind(this.start, this);

      this.startList = __bind(this.startList, this);

      this.renderOne = __bind(this.renderOne, this);

      this.renderAll = __bind(this.renderAll, this);

      this.route = __bind(this.route, this);

      this.stopRouting = __bind(this.stopRouting, this);

      this.startRouting = __bind(this.startRouting, this);

      this.el = $(this.selector);
      this.models = new Object;
      this.model.on('fetch-all' + this.model.url, function(models) {
        var _i, _len;
        for (_i = 0, _len = models.length; _i < _len; _i++) {
          model = models[_i];
          _this.models[model.slug] = model;
        }
        return _this.startRouting();
      });
      this.model.fetchAll();
    }

    Controller.prototype.startRouting = function() {
      $(window).on('hashchange', this.route);
      return this.route();
    };

    Controller.prototype.stopRouting = function() {
      return $(window).off('hashchange');
    };

    Controller.prototype.route = function() {
      var hash, slug;
      hash = location.hash;
      if (hash === '') {
        return this.renderAll();
      } else {
        slug = hash.substr(2, hash.length - 2);
        return this.renderOne(this.models[slug]);
      }
    };

    Controller.prototype.renderAll = function() {
      var compiled, header, key, model;
      compiled = (function() {
        var _ref, _results;
        _ref = this.models;
        _results = [];
        for (key in _ref) {
          model = _ref[key];
          _results.push(this.listTemplate(model));
        }
        return _results;
      }).call(this);
      this.el.html(compiled.join(" "));
      header = "<section class=\"normal\">\n  <h1><strong>Uganda</strong></h1>\n</section>";
      this.el.prepend(header);
      return this.startList(this.models);
    };

    Controller.prototype.renderOne = function(model) {
      var header;
      this.el.html(this.itemTemplate(model));
      header = "<section class=\"normal\">\n  <h1><strong>" + model.name + "</strong></h1>\n</section>";
      this.el.prepend(header);
      return this.start(model);
    };

    Controller.prototype.startList = function() {};

    Controller.prototype.start = function() {};

    return Controller;

  })();

  window.App.Controller = Controller;

}).call(this);