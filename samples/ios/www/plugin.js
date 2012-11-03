
var plugin = {

    createBasic: function() {

        var options = {
            title: 'Title',
            items: ['Foo', 'Bar']
        };

        window.plugins.actionSheet.create(options, function(buttonValue, buttonIndex) {
            var args = Array.prototype.slice.call(arguments, 0);
            console.log("actionSheet.createComplex:" + JSON.stringify(args));
        });
    },

    createComplex: function() {

        var options = {
            items: ['Add', 'Delete', 'Cancel'],
            destructiveButtonIndex: 1,
            cancelButtonIndex: 2
        }

        window.plugins.actionSheet.create(options, function(buttonValue, buttonIndex) {
            var args = Array.prototype.slice.call(arguments, 0);
            console.log("actionSheet.createComplex:" + JSON.stringify(args));
        });
    }

};
