package launch {
	import flash.ui.Keyboard;
	
	import AA.ContentA_StateAA;
	import AA.Main_StateAA;
	import AA.Res_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.Axime;
	import Lv_1.cross.IUniformLauncher;
	import Lv_1.cross.LaunchConfiguration;
	import Lv_1.resource.AssetMachine;
	import Lv_1.window.AWindow;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ContextAA;
	import Lv_2.resource.converters.AtfAssetConvert;
	import Lv_2.resource.converters.AtlasAssetConvert;
	import Lv_2.utils.Stats;
	
	import Lv_3.resource.converters.SwfClassAssetConverter;
	
public class CommonUniformLauncher implements IUniformLauncher {
	
	public function config() : LaunchConfiguration {
		return LaunchConfiguration.create(1080, 1920, false);
	}
	
	public function onLaunch( w:AWindow ) : void {
//		Axime.getInstance().getWindow().getStage().addChild(new Stats());
		
		Axime.getTick().registerTickGroups(new <String>["tickA"]);
		Axime.getTick().getTickGroup("tickA").timeScale = 1.5;
		
		w.getKeyboard().getKey(Keyboard.BACK).setPreventDefault(true);
		//Axime.getTouch().autoUnbindingWhenLeaving = true;
		
		AssetMachine.activate(SwfClassAssetConverter);
		AssetMachine.activate(AtlasAssetConvert);
		AssetMachine.activate(AtfAssetConvert);
		
		//AAFacade.requestRoot(true);
		ContextAA.request(w, new Res_StateAA(new Main_StateAA)).eventRecreate().addListener(____onContextReset);
	}
	
	
	
	private function ____onContextReset(evt:AEvent):void{
		var am:AssetMachine;
		var RLid:uint;
		var contextAA:ContextAA;
		
		am = Axime.getAsset();
		RLid = am.eventComplete().addListener(function(e:AEvent):void{
			am.eventComplete().removeListener(RLid);
			contextAA.getMorph().getNode().visible = true;
			Axime.getTick().timeScale = 1.0;
		});
		am.restartAll();
		contextAA.getMorph().getNode().visible = false;
		Axime.getTick().timeScale = 0.0;
	}
}
}