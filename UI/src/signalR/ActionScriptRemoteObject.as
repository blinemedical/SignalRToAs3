package signalR
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	[RemoteClass(alias="AmfInvoker.ActionScriptRemoteObject")]
	public class ActionScriptRemoteObject extends EventDispatcher
	{
		private var _name:String;
		[Bindable("nameChanged")]
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
			dispatchEvent(new Event("nameChanged"));
		}

		private var _arguments:Array;
		[Bindable("argumentsChanged")]
		public function get arguments():Array
		{
			return _arguments;
		}

		public function set arguments(value:Array):void
		{
			_arguments = value;
			dispatchEvent(new Event("argumentsChanged"));
		}
	}
}
