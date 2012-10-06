package data
{
import flash.events.Event;
import flash.events.EventDispatcher;

import mx.collections.ArrayCollection;

[RemoteClass(alias="Data.TestObject")]
public class TestObject extends EventDispatcher
{
    private var _name:String;
    [Bindable(event="nameChanged")]
    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        if (_name == value) return;
        _name = value;
        dispatchEvent(new Event("nameChanged"));
    }

    private var _intList:ArrayCollection;
    [Bindable(event="intListChanged")]
    public function get intList():ArrayCollection {
        return _intList;
    }

    public function set intList(value:ArrayCollection):void {
        if (_intList == value) return;
        _intList = value;
        dispatchEvent(new Event("intListChanged"));
    }

    public function getString():String{
        var s:String = "";
        for each(var i:int in intList){
            s+= i +", ";
        }

        return name +": " + s;
    }
}
}
