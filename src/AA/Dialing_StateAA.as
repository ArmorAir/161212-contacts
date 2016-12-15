package AA
{
	import Lv_0.events.AEvent;
	import Lv_0.events.ANotification;
	
	import Lv_1.Axime;
	
	import Lv_2.display.FusionAA;
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	import Lv_2.geom.EDirection;
	
	import Lv_3.gesture.GestureMachine;
	import Lv_3.gesture.SwipeGesture;
	import Lv_3.tween.ATween;
	import Lv_3.tween.TweenMachine;
	import Lv_3.tween.easing.Cubic;
	import Lv_3.tween.easing.Quad;
	
	import utils.NotificationConfig;
	import utils.ViewConfig;

public class Dialing_StateAA extends StateAA
{
	
	

	override public function onEnter():void {
		var sg_A:SwipeGesture;
		var img_A:ImageAA;
		
		
		
		
		_switchBtn = new ImageAA;
		_switchBtn.textureId = "img/dialing_btn.png";
		this.getFusion().addNode(_switchBtn);
//		_switchBtn.scaleX = _switchBtn.scaleY = 3.5;
		_switchBtn.pivotX = _switchBtn.getSourceWidth() / 2;
		_switchBtn.x = this.getWindow().windowWidth / 2;
		_switchBtn.y = 1690;
		_switchBtn.eventClick().addListener(____onShowPanel);
	
		
		
		_dialingFN = new FusionAA;
		this.getFusion().addNode(_dialingFN);
		_dialingFN.y = this.getWindow().windowHeight;
		
		_dialingImg = new ImageAA;
		_dialingImg.textureId = "img/dialing.png";
		_dialingFN.addNode(_dialingImg);
		ViewConfig.DIALING_H = _dialingImg.getSourceHeight();
		ViewConfig.LIST_SCROLL_B = ViewConfig.LIST_SCROLL_A + ViewConfig.DIALING_H;
		//_dialingImg.touchable = false;
		
		sg_A = new SwipeGesture;
		GestureMachine.getInstance().addGesture(_dialingImg, sg_A);
		sg_A.eventSuccess().addListener(____onSwipeAndClosePanel);
		
		
		
		img_A = new ImageAA;
		img_A.textureId = "img/frame.png";
		_dialingFN.addNode(img_A);
		img_A.scaleX = img_A.scaleY = 3.0;
		img_A.x = 27;
		img_A.y = 870;
		img_A.visible = false;
		img_A.eventClick().addListener(function(e:AEvent):void{
			Axime.sendNotification(NotificationConfig.CLOSE_DIALING);
		});
		
		
		this.registerNotification(NotificationConfig.SHOW_DIALING);
		this.registerNotification(NotificationConfig.CLOSE_DIALING);
		this.registerNotification(NotificationConfig.REVERSE);
		this.registerNotification(NotificationConfig.ITEM_SELECT);
	}
	
	override public function onNotification(v:ANotification):void {
		if(v.getName() == NotificationConfig.CLOSE_DIALING) {
			this.____xxSwitchPancel(false);
		}
		else if(v.getName() == NotificationConfig.SHOW_DIALING) {
			this.____xxSwitchPancel(true);
		}
		else if(v.getName() == NotificationConfig.REVERSE) {
			this.____xxSwitchPancel(false);
		}
		else if(v.getName() == NotificationConfig.ITEM_SELECT) {
			this.____xxSwitchPancel(false);
		}
	}
	
	
	private var _dialingFN:FusionAA;
	
	private var _dialingImg:ImageAA;
	private var _switchBtn:ImageAA;
	private var _enabled:Boolean;
	
	

	
	private function ____onShowPanel(e:AEvent ) : void {
		
		Axime.sendNotification(NotificationConfig.SHOW_DIALING);
	}
	
	private function ____onSwipeAndClosePanel(e:AEvent):void{
		var sg:SwipeGesture;
		
		sg = e.getTarget() as SwipeGesture;
		if(sg.getDirection() == EDirection.DOWN){
			//this.____xxSwitchPancel(false);
			
			Axime.sendNotification(NotificationConfig.CLOSE_DIALING);
		}
		
	}
	
	
	private function ____xxSwitchPancel(enabled:Boolean):void{
		var tween:ATween;
		
		if(_enabled == enabled) {
			return;
		}
		_enabled = enabled;
		if(enabled){
			tween = TweenMachine.to(_dialingFN, ViewConfig.DIALING_DURA, {y:this.getWindow().windowHeight - _dialingImg.getSourceHeight()}, Cubic.easeOut);
			this.getContext().getMorph().getNode().touchable = false;
			tween.eventComplete().addListener(function(e:AEvent):void{
				getContext().getMorph().getNode().touchable = true
			});
			
		}
		else {
			
			this.getContext().getMorph().getNode().touchable = false;
			tween = TweenMachine.to(_dialingFN,  ViewConfig.DIALING_DURA, {y:this.getWindow().windowHeight});
			tween.eventComplete().addListener(function(e:AEvent):void{
				getContext().getMorph().getNode().touchable = true
			});
			
		}
		
	}
	
}
}