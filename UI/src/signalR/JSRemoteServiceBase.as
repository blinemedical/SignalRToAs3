package signalR
{
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.external.ExternalInterface;
import flash.utils.ByteArray;

public class JSRemoteServiceBase extends EventDispatcher
	{
		private var _initializeService:Boolean = false;

		public static const CONNECTION_ESTABLISHED:String = "ConnectionEstablished";

		public function initializeService():void
		{
			_initializeService = true;
			ExternalInterface.call("startHub");
		}

		public function JSRemoteServiceBase()
		{
			ExternalInterface.addCallback("invokeOnActionScript",externalInvoke);
		}

		private function externalInvoke(remoteObjectB64:String):void
		{
			if(!_initializeService)
			{
				return;
			}

			var bArray:ByteArray  = SignalRBase64.decodeToByteArray(remoteObjectB64);
			bArray.readUnsignedByte();
			var remoteObject:ActionScriptRemoteObject = bArray.readObject() as ActionScriptRemoteObject;

            if(remoteObject.name != null){
		    	this[remoteObject.name].apply(null,remoteObject.arguments);
            }
		}

		public function connectionEstablished():void
		{
			dispatchEvent(new Event(CONNECTION_ESTABLISHED));
		}
	}
}
