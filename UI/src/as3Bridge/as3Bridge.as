/**
 * Created with IntelliJ IDEA.
 * User: anton.kropp
 * Date: 10/5/12
 * Time: 11:27 AM
 * To change this template use File | Settings | File Templates.
 */
package as3Bridge {
import data.TestObject;

import mx.core.Application;

import signalR.JSRemoteServiceBase;

public class as3Bridge extends JSRemoteServiceBase {
    public function TestAmfFunction(testObject:TestObject):void{
        (Application.application as UI).updateText(testObject.getString());
    }
}
}
