package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.greensock.TweenLite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Stroke extends GestureWorks
	{		
		private var letter:TextField = new TextField();
		
		public function Stroke():void
		{
			gml = "stroke-G.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 400, 400);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = stage.stageWidth / 2 - 200;
			touchSprite.y = stage.stageHeight / 2 - 200;
			
			// add touch sprite to display list
			touchSprite.debugDisplay = true;
			addChild(touchSprite);
			
			//stroke letter display
			letter.textColor = 0xFFFFFF;
			letter.selectable = false;
			letter.x = 100;
			letter.y = 100;
			touchSprite.addChild(letter);
			
			// add events 
			touchSprite.gestureList = {"G": true};
			touchSprite.addEventListener(GWGestureEvent.STROKE_LETTER, strokeHandler);
		}
		
		private function strokeHandler(event:GWGestureEvent):void
		{
			letter.text = event.value.id;
			letter.scaleY = letter.scaleX = letter.alpha = 1;
			TweenLite.to(letter, 1, { scaleX:50, scaleY:50, alpha:0 } );
		}
	}

}