# Cordova Plugin Seed #
by [Olivier Louvignes](http://olouv.com)

## DESCRIPTION ##

* This plugin provides a simple way to use the `UIActionSheet` native component from iOS. This plugin is built for Cordova >= v2.1.0 with ARC.

* There is a `Sencha Touch 2.0` plugin to easily leverage this plugin [here](https://github.com/mgcrea/sencha-touch-plugins/blob/master/CordovaActionSheet.js)

## SAMPLE PROJECT GENERATION ##

You can generate a sample XCode project by running `samples/ios/create.sh` from the root of the repository.

## PLUGIN SETUP FOR IOS ##

Using this plugin requires [Cordova iOS](https://github.com/apache/incubator-cordova-ios).

1. Make sure your Xcode project has been [updated for Cordova](https://github.com/apache/incubator-cordova-ios/blob/master/guides/Cordova%20Upgrade%20Guide.md)
2. Rename the `src/ios` folder to `ActionSheet`, drag and drop it from Finder to your Plugins folder in XCode, using "Create groups for any added folders"
3. Add the .js files to your `www` folder on disk, and add reference(s) to the .js files using `<script>` tags in your html file(s)


    `<script type="text/javascript" src="/js/plugins/ActionSheet.js"></script>`


4. Add new entry with key `ActionSheet` and value `ActionSheet` to `Plugins` in `Cordova.plist/Cordova.plist`

## JAVASCRIPT INTERFACE (IOS/ANDROID) ##

    // After device ready, create a local alias
    var actionSheet = window.plugins.actionSheet;

    // Basic with title
    actionSheet.create('Title', ['Foo', 'Bar'], function(buttonValue, buttonIndex) {
        console.warn('create(), arguments=' + Array.prototype.slice.call(arguments).join(', '));
    });

    // Complex
    actionSheet.create(null, ['Add', 'Delete', 'Cancel'], function(buttonValue, buttonIndex) {
        console.warn('create(), arguments=' + Array.prototype.slice.call(arguments).join(', '));
    }, {destructiveButtonIndex: 1, cancelButtonIndex: 2});

* Check [source](https://github.com/mgcrea/cordova-actionsheet/tree/master/www/ActionSheet.js) for additional configuration.

## BUGS AND CONTRIBUTIONS ##

Patches welcome! Send a pull request. Since this is not a part of Cordova Core (which requires a CLA), this should be easier.

Post issues on [Github](https://github.com/mgcrea/cordova-actionsheet/issues)

The latest code (my fork) will always be [here](https://github.com/mgcrea/cordova-actionsheet/tree/master)

## LICENSE ##

    The MIT License

    Copyright (c) 2012 Olivier Louvignes

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

## CREDITS ##

Contributors :

* [Olivier Louvignes](http://olouv.com), author.

