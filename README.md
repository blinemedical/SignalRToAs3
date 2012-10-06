SignalR to AS3 Bridge
=====================

This project demonstrates how to use signalR as a long poll mechanism with AS3/flex.  While Flex supports sockets and FluorineFX has a Flex sockets push solution, using signalR means you can share your broadcast architecture regardless of your frontend.

Also since signalR takes care of the transport and reconnection layer you don't need to worry about cross domain files, socket coding, or any other complexities dealing with push semantics for actionscript.

General Overview
----------------

The general idea is to have a javascript bridge that signalR talks to from the server (using normal signalR mechanisms) and proxy the request from javascript to the swf on the page and vice versa.  

However, the nuisance here is that for every function you want to add for server to client invocation you needed to write double the boilerplate (actionscript AND javascript).

Instead what we've done is wrapped the signalR clients dynamic object in a `ClientProxy` object so that we can funnel arbritrary client side requests through a single javascript function. This way we don't need to create any more boilerplate.  The javascript function will always invoke the same function in actionscript in the `JSRemoteServiceBase` that always sends a single known type through a single javascript function. 

The `ClientProxy` object repackages the function invocation  into a new type called `ActionScriptRemoteObject`. This has a field called `String Name` and a field called `object[] Arguments`.  This is a wrapper object on top of any serializiable objects you send from signalR.   The `Name` is the target method to invoke in actionscript and the `arguments` are base64 AMF serialized objects you want to pass to your as3 function.

Since signalR sends JSON we chose to serialize the AMF objects and then convert them to base64 and send the base64 encoding in the json.  `JSRemoteServiceBase` will take the base64 encoding of `ActionScriptRemoteObject`, convert it back to a byte array, and then deserialize the amf and properly invoke the requested function on the subclass of `JSRemoteServiceBase`.  


Package Structure
-----------------

The project contains a `Server` folder and a `UI` folder. The `Server` folder has a self contained solution that has 
   
#Server
                                                   
### AmfInvoker
- Contains the `ClientProxy` which wraps the signalR dynamic object and re-packages requests to be through the single known javascript bridge
- Contains the Amf Serialiation and base64 encoding
- Contains the base `ActionScriptRemoteObject` class that is the payload through javascript to actionscript

### Data
- Basic data namespace containing a test object we serialize

### Hubs
- Contains the signalR hub declaration as well as a hub processor that is responsible for doing all the work. The hub is just there to hand signalR requests to the processor

### Server Root
- This contains the basic shell of the web root. 
- Note Scripts/app.js which contains the only javascript entry point required for the as3 bridge and handles proxying of server side requests. If we wanted to send data back from the client to server we'd still need to create a proxy point manually. The demonstration is only for server to client invocation (push)

#UI

### SignalR 

- This has the actionscript base class `JSRemoteServiceBase` which handles incoming requests from the server.  We subclass this base class and any function we want to invoke in actionscript should go in the subclass

### Data

- Data namespace containing the test object

### As3Bridge 

- Subclass of `JSRemoteServiceBase` which updates the main app with the text of the test object that was sent from the server
