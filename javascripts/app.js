// Generated by CoffeeScript 1.3.3
(function() {

  window.App = {};

}).call(this);
// Generated by CoffeeScript 1.3.3
(function() {
  var Model,
    __slice = [].slice;

  Model = (function() {

    function Model() {}

    Model.prototype.constrcutor = function(opts) {
      return this.id = opts.id;
    };

    Model.prototype.base_url = 'url_here';

    Model.prototype.trigger = function() {
      var args, event;
      event = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return $(document).trigger(event, args);
    };

    Model.prototype.on = function(event, callback) {
      return $(document).on(event, callback);
    };

    Model.prototype.fetch = $.getJSON("http://" + Model.base_url + "/" + Model.url + "/" + Model.id + ".json", function(data) {
      var key, value, _i, _len;
      for (value = _i = 0, _len = data.length; _i < _len; value = ++_i) {
        key = data[value];
        this[key] = value;
      }
      return this.trigger('fetch', this);
    });

    return Model;

  })();

  window.App.Model = Model;

}).call(this);
// Generated by CoffeeScript 1.3.3
(function() {
  var School,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  School = (function(_super) {

    __extends(School, _super);

    function School(opts) {
      School.__super__.constructor.call(this, opts);
    }

    School.prototype.url = 'path to resource here';

    return School;

  })(window.App.Model);

  window.App.School = School;

}).call(this);
// Generated by CoffeeScript 1.3.3
(function() {
  var University,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  University = (function(_super) {

    __extends(University, _super);

    function University(opts) {
      University.__super__.constructor.call(this, opts);
    }

    University.prototype.url = 'path to resource here';

    return University;

  })(window.App.Model);

  window.App.University = Model;

}).call(this);
