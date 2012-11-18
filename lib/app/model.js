// Generated by CoffeeScript 1.3.3
(function() {
  var Model,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Model = (function(_super) {

    __extends(Model, _super);

    function Model(opts) {
      this.fromJSON = __bind(this.fromJSON, this);

      this.fetch = __bind(this.fetch, this);
      this.id = opts.id || opts.data.id;
      if (opts.data != null) {
        this.fromJSON(opts.data);
      }
    }

    Model.base_url = 'pedapi.herokuapp.com';

    Model.prototype.fetch = function() {
      var _this = this;
      return $.getJSON("https://" + this.constructor.base_url + "/" + this.constructor.url + "/" + this.id + ".json?callback=?", function(data) {
        _this.fromJSON(data);
        return _this.trigger('fetch', _this);
      });
    };

    Model.prototype.fromJSON = function(data) {
      var key, value, _results;
      _results = [];
      for (key in data) {
        value = data[key];
        _results.push(this[key] = value);
      }
      return _results;
    };

    Model.all = function() {
      return Model.models;
    };

    Model.fetchAll = function() {
      var _this = this;
      return $.getJSON("https://" + this.base_url + "/" + this.url + ".json?callback=?", function(data) {
        var datum, _i, _len;
        _this.models = new Array;
        for (_i = 0, _len = data.length; _i < _len; _i++) {
          datum = data[_i];
          _this.models.push(new _this({
            data: datum
          }));
        }
        return _this.trigger('fetch-all' + _this.url, _this.models);
      });
    };

    Model.fetchById = function(id) {
      return $.getJSON("https://" + this.base_url + "/" + this.url + "/" + id + ".json?callback=?", function(data) {
        var model;
        model = new this({
          data: data
        });
        return this.trigger('fetch', model);
      });
    };

    return Model;

  }).call(this, window.App.Events);

  window.App.Model = Model;

}).call(this);