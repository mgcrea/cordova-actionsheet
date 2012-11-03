//
//  ActionSheet.js
//
// Created by Olivier Louvignes on 2011-11-27.
//
// Copyright 2011-2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

(function(cordova) {

	function ActionSheet() {}

	ActionSheet.prototype.create = function(options, callback) {
		options || (options = {});
		var scope = options.scope || null;

		var config = {
			title : options.title || '',
			items : options.items || ['Cancel'],
			style : options.style || 'default',
			destructiveButtonIndex : options.hasOwnProperty('destructiveButtonIndex') ? options.destructiveButtonIndex : undefined,
			cancelButtonIndex : options.hasOwnProperty('cancelButtonIndex') ? options.cancelButtonIndex : undefined
		};

		var _callback = function(result) {
			var buttonValue = false, // value for cancelButton
				buttonIndex = result.buttonIndex;
			if(!config.cancelButtonIndex || buttonIndex != config.cancelButtonIndex) {
				buttonValue = config.items[buttonIndex];
			}
			if(typeof callback == 'function') callback.apply(scope, [buttonValue, buttonIndex]);
		};

		return cordova.exec(_callback, _callback, 'ActionSheet', 'create', [config]);
	};

	cordova.addConstructor(function() {
		if(!window.plugins) window.plugins = {};
		window.plugins.actionSheet = new ActionSheet();
	});

})(window.cordova || window.Cordova);
