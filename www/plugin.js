
var exec = require('cordova/exec');

var PLUGIN_NAME = 'ASAAttributionPlugin';

var ASAAttributionPlugin = {
  fetchAttributionToken: function(successCallback,errorCallback) {
    exec(successCallback,errorCallback, PLUGIN_NAME, 'fetchAttributionToken', []);
  }
};

module.exports = ASAAttributionPlugin;
