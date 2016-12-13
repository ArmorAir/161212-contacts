package AA.comps
{
	import Lv_0.events.AEvent;
	
	import Lv_1.Axime;
	
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.display.Scale9ImageAA;
	
	import utils.NotificationConfig;
	import utils.ViewConfig;

public class ContentTab_StateAA extends StateAA
{
	
	
	override public function onEnter():void {
		var img_A:ImageAA;
		var s9img_A:Scale9ImageAA;
		
		
		s9img_A = new Scale9ImageAA;
		s9img_A.textureId = "img/s9white.png";
		this.getFusion().addNode(s9img_A);
		s9img_A.width = this.getWindow().windowWidth;
		s9img_A.height = ViewConfig.TAB_H;
		
		
		img_A = new ImageAA;
		img_A.textureId = "img/tab_2.png";
		this.getFusion().addNode(img_A);
		img_A.pivotX = img_A.getSourceWidth() / 2;
		img_A.x = this.getWindow().windowWidth / 2;
		img_A.pivotY = img_A.getSourceHeight() / 2;
		img_A.y = 310;
		
		img_A = new ImageAA;
		img_A.textureId = "img/sort.png";
		this.getFusion().addNode(img_A);
		img_A.x = 880;
		img_A.pivotY = img_A.getSourceHeight() / 2;
		img_A.y = 310;
		img_A.eventClick().addListener(function(e:AEvent):void{
			
			Axime.sendNotification(NotificationConfig.REVERSE);
			
		});
		
	}
	
	override public function onExit():void {
		
	}
	
	
	
	
	
	
}
}