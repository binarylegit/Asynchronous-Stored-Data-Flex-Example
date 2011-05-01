package {

	import flash.events.Event;

	public class MessageEvent extends Event {

		
		public static const MESSAGE:String = "messageEvent";

		private var _message:String;
		
		public function MessageEvent(type:String, message:String, bubbles:Boolean = false, cancelable:Boolean = false):void {
			this._message = message;
			super(type, bubbles, cancelable);
		}

		public function get message():String {
			return _message;
		}
	}
}

