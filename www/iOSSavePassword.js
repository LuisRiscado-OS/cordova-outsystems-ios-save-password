var exec = require('cordova/exec');

var SavePassword = {
    promptDialog: function (username, password, success, error) {
        exec(success, error, 'SavePassword', 'promptDialog', [username, password]);
    }
};

module.exports = SavePassword;