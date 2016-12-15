package AA.comps
{
	import AA.ContentB_StateAA;
	
	import Lv_0.events.AEvent;
	import Lv_0.events.ANotification;
	
	import Lv_1.Axime;
	
	import Lv_2.display.FusionAA;
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.display.Scale9ImageAA;
	import Lv_3.display.advanced.RawCheckAA;
	
	import utils.NotificationConfig;
	import utils.ViewConfig;

public class ContentTab_StateAA extends StateAA
{
	
	public function ContentTab_StateAA(isReverse:Boolean ) {
		x_isReverse = isReverse;
	}
	
	public function isItemSelectStatus():Boolean {
		return x_itemFN.visible;
	}
	
	override public function onEnter():void {
		var img_A:ImageAA;
		var s9img_A:Scale9ImageAA;
		var check_A:RawCheckAA;
		
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
		img_A.textureId = x_isReverse ? "img/sort_B.png" : "img/sort_A.png";
		this.getFusion().addNode(img_A);
		img_A.x = 880;
		img_A.pivotY = img_A.getSourceHeight() / 2;
		img_A.y = 310;
		img_A.eventClick().addListener(function(e:AEvent):void{
			x_itemFN.visible = !x_itemFN.visible;
			x_itemFN.touchable = !x_itemFN.touchable;
//			Axime.sendNotification(NotificationConfig.REVERSE);
			
			
			Axime.sendNotification(NotificationConfig.ITEM_SELECT);
		});
		
		
		
		x_itemFN = new FusionAA;
		this.getFusion().addNode(x_itemFN);
		x_itemFN.touchable = false;
		x_itemFN.visible = false;
		x_itemFN.y = ViewConfig.TAB_H ;
		
		
		img_A = new ImageAA;
		img_A.textureId = "img/mask.png";
		x_itemFN.addNode(img_A);
		img_A.eventClick().addListener(function(e:AEvent):void{
//			Axime.sendNotification(NotificationConfig.CLOSE_DIALING);
			
			x_itemFN.visible = !x_itemFN.visible;
			x_itemFN.touchable = !x_itemFN.touchable;
		});
		
		
		
		img_A = new ImageAA;
		img_A.textureId = x_isReverse ? "img/itemA_1.png" : "img/itemA_2.png";
		x_itemFN.addNode(img_A);
		img_A.eventClick().addListener(function(e:AEvent):void{
			Axime.sendNotification(NotificationConfig.REVERSE, false);
		});
		
		img_A = new ImageAA;
		img_A.textureId = x_isReverse ? "img/itemB_2.png" : "img/itemB_1.png";
		x_itemFN.addNode(img_A);
		img_A.y = img_A.getSourceHeight();
		img_A.eventClick().addListener(function(e:AEvent):void{
			Axime.sendNotification(NotificationConfig.REVERSE, true);
		});
		
//		check_A = new RawCheckAA("img/sort_A.png", "img/sort_B.png", false, true);
//		check_A.x = 880;
//		check_A.pivotY = check_A.getImage().getSourceHeight() / 2;
//		check_A.y = 310;
//		this.getFusion().addNode(check_A);
//		
//		check_A.getSelected().eventChange().addListener(function(e:AEvent):void{
//			
//			Axime.sendNotification(NotificationConfig.REVERSE);
//			
//		});
		
		this.registerNotification(NotificationConfig.SHOW_DIALING);
	}
	
	override public function onExit():void {
		
	}
	
	
	override public function onNotification(v:ANotification):void {
		
		if(v.getName() == NotificationConfig.SHOW_DIALING) {
			if(x_itemFN.visible) {
				x_itemFN.visible = false;
				x_itemFN.touchable = false;
			}
			
			
		}
	}
	
	
	
	private var x_isReverse:Boolean;
	private var x_itemFN:FusionAA;
	
	
}
}