
var plugin = {
    createBasic: function() {
        window.plugins.actionSheet.create('Title', ['Foo', 'Bar'], function(buttonValue, buttonIndex) {
            var args = Array.prototype.slice.call(arguments, 0);
            console.log("actionSheet.createComplex:" + JSON.stringify(args));
        });
    },
    createComplex: function() {
        window.plugins.actionSheet.create(null, ['Add', 'Delete', 'Cancel'], function(buttonValue, buttonIndex) {
            var args = Array.prototype.slice.call(arguments, 0);
            console.log("actionSheet.createComplex:" + JSON.stringify(args));
        }, {destructiveButtonIndex: 1, cancelButtonIndex: 2});
    }
};

