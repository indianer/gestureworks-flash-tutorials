package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWTouchEvent;
	import com.gestureworks.managers.Leap2DManager;
	import com.gestureworks.managers.MotionManager;
	import com.gestureworks.managers.TUIOManager;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.Pointable;
	import flash.display.Loader;
	import flash.events.TouchEvent;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0xFFFFFF", frameRate = "30")]

	public class Main extends GestureWorks 
	{
		
		public function Main():void 
		{
			super();
			gml = "my_gestures.gml"
			fullscreen = true;
									
			//enable TUIO input
			tuio = true;
			//tuio = "protocol:flosc";
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			var myTouchSprite:TouchSprite = new TouchSprite();
			var loader:Loader = new Loader();
			loader.load(new URLRequest("galaxy.jpg"));
			myTouchSprite.addChild(loader);
			addChild(myTouchSprite);			
			
			myTouchSprite.gestureList = { "n-drag-inertia":true, "n-scale-inertia":true, "n-rotate-inertia":true };
			myTouchSprite.releaseInertia = true;			
			myTouchSprite.nativeTransform = true;			
		}

	}
	
}