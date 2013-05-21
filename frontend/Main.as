package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.net.URLRequestHeader;
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONEncoder;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	


	public class Main extends MovieClip
	{

		public var mapContainer:Sprite;
		//public var minimap:Minimap;

		public var redrawM:Boolean;

		private var dataArr:*;
		private var lvlArr:Array;
		private var lvlCounter:int = 1;
		
		public var hover:Sprite;
		public var w:int;
		public var h:int;

		private var lastMX:int;
		private var lastMY:int;

		private var mapPosX:int;
		private var mapPosY:int;

		private var scale_:Number = 0;

		private var mouseD:Boolean;
		private var nodeContainer:Sprite;
		private var scaleS:Number;
		private var url = "http://127.0.0.1/dummy_json/index.php";
		private var header:URLRequestHeader = new URLRequestHeader("pragma", "no-cache");
		private var drawArr;
		private var urlReq;//= new URLRequest("http://127.0.0.1/dummy_json/index.php?zoom_lvl=1");
		private var urlLoader;
		public function Main()
		{
			
			lvlArr = new Array();
			lvlArr.push("contry");
			lvlArr.push("province");
			lvlArr.push("district");
			lvlArr.push("community");
			

			mouseD = false;

			scaleS = 1;

			mapContainer = new Sprite();
			this.addChild(mapContainer);
			
			redrawM = true;
			
			//dataArr = new Array();
		}

		
		public function setup() {
			//request GET /geo/country/1
			redrawM = true;
			drawHover();
			drawMap();

			setListeners();
		}
		
		private function requestHandler(e:Event) {
			dataArr = null;
			dataArr=com.adobe.serialization.json.JSON.decode(e.target.data);
			//drawArr = new Array(test.border);
			
			
			loc_btn.label = dataArr.name;
			//trace(dataArr.border);
			setup();
			
			
			
			
		}

		public function setDimensions(w:int, h:int)
		{


			this.w = w;
			this.h = h;
			
			 
			
			makeRequest();
			
		}

		private function makeRequest() {
			trace("req");
			urlLoader = null;
			urlReq = null;
			trace(url + "?zoom_lvl=" +lvlCounter+"&b=" + Math.random()*100000);
			urlReq = new URLRequest(url + "?zoom_lvl=" +lvlCounter+"&b=" + Math.random()*100000);
			urlReq.requestHeaders.push(header);
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, requestHandler);
			urlLoader.load(urlReq);
			
		}


		public function drawHover()
		{

			hover = new Sprite();
			hover.graphics.beginFill(0x000000,0);
			hover.graphics.drawRect(0,0,this.w,this.h);
			this.addChild(hover);


		}

		private function findSmallest():Array{
			
			var ret:Array = new Array();
			var px:int =dataArr.border[0].x;
			var py:int =dataArr.border[0].y;
				
			var minX:int = px;
			var maxX:int = px;
			var minY:int = py;
			var maxY:int = py;
			
			for (var i:int=1; i<dataArr.border.length; i++)
					{
						px =dataArr.border[i].x;
			 			py =dataArr.border[i].y;
						
						if(px<minX) {
							minX = px;
						} else if(px>maxX) {
							maxX = px;
						}
						
						if(py<minY) {
							minY = py;
						} else if(py>maxY) {
							maxY = py;
						}
						
					}
					
					
				var scale_X:Number = w*0.92/(maxX - minX);
				var scale_Y:Number = h*0.92/(maxY - minY);
				var scale_:Number = 0;
				if(scale_X<scale_Y) {
					scale_ = scale_Y;
				} else {
					scale_ = scale_X;
					}				
							ret.push(scale_);
							ret.push(minX);
							ret.push(minY);
			return ret;
		}
		
		public function drawMap()
		{
			if (redrawM)
			{
				redrawM = false;
				this.removeChild(mapContainer);
				mapContainer = null;
				mapContainer = new Sprite();

				var px:int = 0;
				var py:int = 0;
				var vector:Array = findSmallest();
				scale_ = vector[0];
				
				trace(scale_);

				px =(dataArr.border[0].x - vector[1] +1)*scale_;
				py =(dataArr.border[0].y- vector[2] +1)*scale_;

				mapContainer.graphics.moveTo(px,py);
				mapContainer.graphics.lineStyle(3,0x00ff00);
				
				

					nodeContainer = new Sprite();
					for (var i:int=1; i<dataArr.border.length; i++)
					{
						
						px =(dataArr.border[i].x- vector[1]+1) * scale_;
						py =(dataArr.border[i].y- vector[2]+1) * scale_;
						mapContainer.graphics.lineTo(px,py);///scaleS,py/scaleS);
						mapContainer.graphics.moveTo(px,py);//scaleS,py/scaleS);
						
						
	
					}
					px =(dataArr.border[0].x - vector[1]+1)*scale_;
					py =(dataArr.border[0].y - vector[2]+1)*scale_;
					mapContainer.graphics.lineTo(px,py);///scaleS,py/scaleS);
					mapContainer.graphics.moveTo(px,py);///scaleS,py/scaleS);


				var bitmap:BitmapData = new BitmapData(w, h);
				bitmap.draw(mapContainer);
				
				mapContainer = null;
				mapContainer = new Sprite();
				mapContainer.addEventListener(MouseEvent.CLICK, mapHandler);
				mapContainer.addChild(new Bitmap(bitmap));
				this.addChild(mapContainer);
				//this.setChildIndex(mapContainer,0);
				this.setChildIndex(loc_btn,numChildren-1);
				this.setChildIndex(back_btn,numChildren-1);
				
				
			} 


		}
		
		private function mapHandler(e:MouseEvent) {
			
			trace(int(e.localX+scale_));
			lvlCounter+=1;
			makeRequest();
			
		}

		public function setListeners()
		{

			//this.addEventListener(MouseEvent.CLICK, mouseHandler);
			//this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, mouseHandler);
			//this.addEventListener(MouseEvent.MOUSE_WHEEL, mouseHandler);
			//stage.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, mouseHandler);
			//stage.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, mouseHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, mouseHandler);

			this.addEventListener(Event.ENTER_FRAME, frameHandler);
			
			back_btn.addEventListener(MouseEvent.CLICK, buttonHandler);
			loc_btn.addEventListener(MouseEvent.CLICK, buttonHandler);

		}
		
		private function keyboardHandler(e:KeyboardEvent) {
			trace(e.keyCode);
			switch(e.keyCode) {
				case 37:
					mapContainer.x-=5;
				break;
				
				case 38:
					mapContainer.y-=5;
				break;
				
				case 39:
					mapContainer.x+=5;
				break;
				
				case 40:
					mapContainer.y+=5;
				break;
				
				
				
			}
			
		}
		
		private function buttonHandler(e:MouseEvent) {
			trace("aaaa");
			switch(e.target) {
				
				case back_btn:
					lvlCounter=1;
					makeRequest();
				break;
				
				
			}
			
		}
		
		private function frameHandler(e:Event)
		{
			if (mouseD)
			{

				trace("dragging");
				//if(this.mapContainer.x<
				drawMap();
				this.mapPosX +=  mouseX - lastMX;
				this.mapPosY +=  mouseY - lastMY;

				this.mapContainer.x = mapPosX;
				this.mapContainer.y = mapPosY;
				this.lastMX = mouseX;
				this.lastMY = mouseY;
				//scaleS = 1;

				//minimap.drawRedRect(this.mapContainer.x*(-1)*scaleS,this.mapContainer.y*(-1)*scaleS, scaleS);


			}


		}

		public function mouseHandler(e:MouseEvent)
		{
			trace(e.type);
			switch (e.type)
			{
				case "mouseWheel" :
					trace("rolling");
					trace(e.delta);

					if (e.delta > 0)
					{
						scaleS /=  1.1;
					}
					else
					{

						scaleS /=  1 / 1.1;
					}
					drawMap();
					//minimap.drawRedRect(this.mapContainer.x*(-1)*scaleS,this.mapContainer.y*(-1)*scaleS, scaleS);

					mouseD = false;
					break;

				case "mouseOut" :
					mouseD = false;

					break;
				case "middleMouseDown" :
					lastMX = mouseX;
					lastMY = mouseY;
					mouseD = true;
					break;

				case "middleMouseUp" :
					mouseD = false;

					trace(this.mapContainer.x);
					break;




				case "click" :
					mouseD = false;
					//lvlcounter +1
					//para najblizszych punktow albo equest po x/y
					//request
					
					break;


			}


		}
		
		
	}

}