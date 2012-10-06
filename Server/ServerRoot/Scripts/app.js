var as3Hub;

function startHub() {
    // Created proxy
    as3Hub = $.connection.as3Hub;

    // register our only function
    as3Hub.InvokeOnActionScript = invokeOnActionScript;

    // Start the connection 
    $.connection.hub.start();
}

// when we invoke from the server we need to proxy to the swf
function invokeOnActionScript(data) {
    getSWF().invokeOnActionScript(data);
}
