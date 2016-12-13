package AA {
	import flash.geom.Rectangle;
	
	import AA.comps.ContentList_StateAA;
	import AA.comps.ContentTab_StateAA;
	
	import Lv_0.events.AEvent;
	import Lv_0.events.ANotification;
	
	import Lv_1.Axime;
	import Lv_1.window.Touch;
	
	import Lv_2.display.ImageAA;
	import Lv_2.display.MorphAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.display.advanced.DragFusionAA;
	import Lv_3.tween.ATween;
	
	import utils.NotificationConfig;
	import utils.ViewConfig;
	
public class ContentA_StateAA extends StateAA {
	
	
	override public function onEnter() : void {
		var img:ImageAA;
		var ctMo:MorphAA;
		var ctNode:NodeAA;
		
		
		_dragFN = new DragFusionAA;
		this.getFusion().addNode(_dragFN);
		
		
		
		_clState = new ContentList_StateAA;
		ctMo = this.getMorph().createMorph(_clState);
		ctNode = ctMo.getNode();
		_dragFN.addNode(ctNode);
		ctNode.y = ViewConfig.TAB_H;
		
		
		
		ctMo = this.getMorph().createMorph(new ContentTab_StateAA(false));
		ctNode = ctMo.getNode();
		_dragFN.addNode(ctNode);
		
		
		_dragFN.eventPress().addListener(____onDrag);
		_dragFN.eventStartDrag().addListener(____onCloseDialing);
//		_dragFN.eventRelease().addListener(____onCloseDialing);
		
		
	}
	
	
	
	
	private var _dragFN:DragFusionAA;
	private var _clState:ContentList_StateAA;
	
	
	
	private function ____onDrag(e:AEvent):void{
		var touch:Touch;
		
		touch = _dragFN.eventPress().getTouch();
		
		_dragFN.startDrag(touch, new Rectangle(0, -ViewConfig.LIST_SCROLL_A,0, ViewConfig.LIST_SCROLL_A));
	}
	
	private function ____onCloseDialing(e:AEvent):void {
		
		Axime.sendNotification(NotificationConfig.CLOSE_DIALING);
		
	}
	
}
}