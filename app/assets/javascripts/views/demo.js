/**
 * Created by git on 14-9-18.
 */

AppView = Backbone.View.extend({
    el: $("body"),
    initialize: function () {
        //构造函数，实例化一个World集合类，并且以字典方式传入AppView的对象
        this.worlds = new Worlds(null, { view : this })
    },
    events: {
        "click #check":  "checkIn"   //事件绑定，绑定Dom中id为check的元素
    },
    checkIn: function () {
        var world_name = prompt("请问，您是哪星人?");
        if(world_name == "") world_name = '未知';
        var world = new World({ name: world_name });
        this.worlds.add(world);
    },
    addOneWorld: function(model) {
        $("#world-list").append("<li>这里是来自 <b>" + model.get('name') + "</b> 登录！</li>");
    }
});
//实例化AppView
var appview = new AppView;