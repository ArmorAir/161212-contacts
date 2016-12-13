package AA
{
	import flash.geom.Rectangle;
	
	import AA.comps.ContentList_StateAA;
	import AA.comps.ContentTab_StateAA;
	
	import Lv_0.events.AEvent;
	import Lv_0.events.ANotification;
	
	import Lv_1.window.Touch;
	
	import Lv_2.display.ImageAA;
	import Lv_2.display.MorphAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.display.advanced.DragFusionAA;
	import Lv_3.tween.ATween;
	import Lv_3.tween.TweenMachine;
	import Lv_3.tween.easing.Cubic;
	
	import utils.NotificationConfig;
	import utils.ViewConfig;

public class ContentB_StateAA extends StateAA
{
	
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
		ctNode.y = ViewConfig.TAB_H3;
		
		
		
		ctMo = this.getMorph().createMorph(new ContentTab_StateAA);
		_tabNode = ctMo.getNode();
		this.getFusion().addNode(_tabNode);
		//_tabNode.y = -ViewConfig.TAB_H2;
		
		
		_dragFN.y = -ViewConfig.LIST_SCROLL_A - LIST_OFFSET_A;
		
		
		_dragFN.eventPress().addListener(____onStartDrag);
		_dragFN.eventMove().addListener(____onDragging);
		
		
		
		this.registerNotification(NotificationConfig.SHOW_DIALING);
		this.registerNotification(NotificationConfig.CLOSE_DIALING);
		
	}
	
	override public function onNotification(v:ANotification):void {
		var tween:ATween;
		var finalY:Number;
		
		if(v.getName() == NotificationConfig.CLOSE_DIALING) {
			if(_dragFN.y + ViewConfig.DIALING_H > 0) {
				finalY = 0;
			}
			else {
				finalY = _dragFN.y + ViewConfig.DIALING_H;
			}
			tween = TweenMachine.to(_dragFN, ViewConfig.DIALING_DURA, {y:finalY});
			_isDialing = false;
			
			this.____xxCheckTabPanel(finalY);
		}
		else if(v.getName() == NotificationConfig.SHOW_DIALING) {
			tween = TweenMachine.to(_dragFN, ViewConfig.DIALING_DURA, {y:_dragFN.y - ViewConfig.DIALING_H}, Cubic.easeOut);
			_isDialing = true;
			
			this.____xxShowTab(false);
		}
		
		
	}
	
	
	
	private const LIST_OFFSET_A:int = -129;
	
	
	private var _dragFN:DragFusionAA;
	private var _clState:ContentList_StateAA;
	private var _isDialing:Boolean;
	
	private var _tabNode:NodeAA;
	private var _isTabEnabled:Boolean;
	
	
	
	
	private function ____onStartDrag(e:AEvent):void{
		var touch:Touch;
		
		touch = _dragFN.eventPress().getTouch();
		
		if(_isDialing){
			_dragFN.startDrag(touch, new Rectangle(0, -ViewConfig.LIST_SCROLL_B - LIST_OFFSET_A, 0, ViewConfig.LIST_SCROLL_B + LIST_OFFSET_A));
		}
		else {
			_dragFN.startDrag(touch, new Rectangle(0, -ViewConfig.LIST_SCROLL_A - LIST_OFFSET_A, 0, ViewConfig.LIST_SCROLL_A + LIST_OFFSET_A));
		}
	}
	
	private function ____onDragging(e:AEvent):void{
		if(!_isDialing) {
			this.____xxCheckTabPanel(_dragFN.y);
		}
	}
	
	private function ____xxCheckTabPanel(dragY:Number) : void {
		if(dragY <= -ViewConfig.LIST_SCROLL_A - LIST_OFFSET_A + 15){
			this.____xxShowTab(true);
		}
		else {
			this.____xxShowTab(false);
		}
	}
	
	private function ____xxShowTab(enabled:Boolean) :void{
		var tween:ATween;
		
		if(_isTabEnabled == enabled){
			return;
		}
		_isTabEnabled = enabled;
		if(_isTabEnabled) {
			tween = TweenMachine.to(_tabNode, ViewConfig.DIALING_DURA, {y:0}, Cubic.easeOut);
		}
		else {
			tween = TweenMachine.to(_tabNode, ViewConfig.DIALING_DURA, {y:-ViewConfig.TAB_H2});
		}
	}
	
}
}