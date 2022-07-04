var exec = require('cordova/exec');

exports.load = function(options, success, error) {
    exec(success, error, 'app-group-file-sharing', 'load', [options]);
};