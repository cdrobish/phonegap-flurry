var exec = require("cordova/exec");

function Flurry() {
// do nothing
}

/**
 * Caution: It will enable the event logging by default
 */
Flurry.prototype.startSession = function (apiKey, options, success, error) {
    if (!options) {
        exec(success, error, 'Flurry', 'startSession', [apiKey]);
    } else {
        exec(success, error, 'Flurry', 'startSessionWithOptions', [apiKey, options]);
    }
};

Flurry.prototype.setDebugLogEnabled = function (enable, success, error) {
    exec(success, error, 'Flurry', 'setDebugLogEnabled', [enable]);
};

Flurry.prototype.logEvent = function (event, parameters, timed, success, error) {
    var callTimed = typeof timed !== 'undefined' && timed !== null;
    var callParameters = typeof parameters !== 'undefined' && parameters !== null;
    
    if (callTimed) {
        if (callParameters) {
            exec(success, error, 'Flurry', 'logTimedEventWithParameters', [event, parameters, timed]);
        } else {
            exec(success, error, 'Flurry', 'logTimedEvent', [event, timed]);
        }
    } else {
        if (callParameters) {
            exec(success, error, 'Flurry', 'logEventWithParameters', [event, parameters]);
        } else {
            exec(success, error, 'Flurry', 'logEvent', [event]);
        }
    }
};

Flurry.prototype.endTimedEvent = function (event, parameters, success, error) {
    parameters = parameters || {};
    exec(success, error, 'Flurry', 'endTimedEventWithParameters', [event, parameters]);
};


var flurry = new Flurry;
module.exports = flurry;
