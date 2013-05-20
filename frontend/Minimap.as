package  {
	
	import flash.display.Sprite;
	
	public class Minimap extends Sprite {
		private var minimap:Sprite;
		private var orginalWidth:int;
		private var orginalHeight:int;
		
		private var redRect:Sprite;
		public function Minimap() {
			// constructor code
			redRect = new Sprite();
			this.addChild(redRect);
		}
		public function setDimensions(w:int, h:int) {
			this.orginalWidth = w;
			this.orginalHeight= h;
			
			
			
		}
		
		public function drawMinimap() {
			
			minimap = new Sprite();
			minimap.graphics.beginFill(0x999999, 0.6);
			minimap.graphics.drawRect(0,0, orginalWidth/8, orginalHeight/8);
			this.addChild(minimap);
			
			
			
			
		}
		
		public function drawRedRect(startX:int, startY:int, scaleS:Number) {
			//if(this.getChildByName(redRect.name)!=null) {
				this.removeChild(redRect);
			//}
			this.redRect = null;
			this.redRect = new Sprite();
			this.redRect.graphics.beginFill(0x000000,0);
			this.redRect.graphics.lineStyle(2,0xee0000);
			this.redRect.graphics.drawRect(startX/8, startY/8,minimap.width*scaleS,minimap.height*scaleS);
			this.addChild(redRect);
			
		}
		
		/*public function moveRedRect(scale:int, startX:int, startY:int) {
			
			this.red
			
		}*/
	}
	
}
