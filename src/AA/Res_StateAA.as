package AA {
	import Lv_0.events.AEvent;
	
	import Lv_1.Axime;
	import Lv_1.resource.AssetMachine;
	import Lv_1.resource.FilesBundle;
	
	import Lv_2.display.StateAA;
	import Lv_2.resource.handlers.TextureAA_BundleHandler;
	
public class Res_StateAA extends StateAA {
	
	
	public function Res_StateAA( nextState:StateAA ) :void{
		m_nextState = nextState;
		
	}
	
	override public function onEnter() : void {
		var AY:Vector.<String>;
		
		am = Axime.getAsset();
		
		AY = new <String>
			[
				"img/frame.png", 
				"img/dialing.png",
				"img/dialing_btn.png",
				"img/tab_1.png", 
				"img/tab_2.png", 
				"img/bg_A.png",
				"img/s9white.png",
				"img/sort.png", 
				"img/sort_A.png", 
				"img/sort_B.png", 
				"img/content_A.png"
			];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(this.getContext(), 1.0, false));
		
		_RLid = am.eventComplete().addListener(onComplete);
	}
	
	
	private var am:AssetMachine;
	private var m_nextState:StateAA;
	private var _RLid:uint;
	
	
	private function onComplete(e:AEvent):void {
		am.eventComplete().removeListener(_RLid);
		
		this.getMorph().switchTo(m_nextState);
	}
}
}