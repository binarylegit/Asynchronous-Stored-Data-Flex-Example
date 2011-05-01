package {

	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;

	public class SingleService extends EventDispatcher{

		private var serviceURL:String = "http://localhost/flex_async_service.php?id=";
		private var _storedId:Number;
		private var request:URLRequest;
		private var loader:URLLoader;

		public function SingleService(id:Number):void {
			_storedId = id;
		}

		public function call(id:Number):void {
			var request:URLRequest = new URLRequest(serviceURL + storedId);

			loader = new URLLoader();
			loader.dataFormat = "text";
			loader.addEventListener(Event.COMPLETE, serviceCompleteHandler);
			loader.load(request);
		}

		public function serviceCompleteHandler(event:Event):void {
			var messageEvent:MessageEvent = new MessageEvent(MessageEvent.MESSAGE, event.target.data as String);
			//messageEvent.target = this;
			this.dispatchEvent(messageEvent);
		}

		public function get storedId():Number {
			return _storedId;
		}

	}
}
