package {

	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;

	public class SharedService extends EventDispatcher{


		public var sharedId:Number;

		public var loader:URLLoader;

		public function call(id:Number):void {
			sharedId = id;

			var request:URLRequest = new URLRequest("http://localhost/flex_async_service.php?id=" + sharedId);
			loader = new URLLoader();
			loader.dataFormat = "text";
			loader.addEventListener(Event.COMPLETE, serviceCompleteHandler);
			loader.load(request)
		}

		public function serviceCompleteHandler(event:Event):void {
			var messageEvent:MessageEvent = new MessageEvent(MessageEvent.MESSAGE, event.target.data as String);
			this.dispatchEvent(messageEvent);
		}



	}
}
