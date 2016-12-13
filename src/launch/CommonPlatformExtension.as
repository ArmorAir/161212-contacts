package launch {
	import flash.display.Stage;
	import flash.ui.Multitouch;
	
	import Lv_0.logging.ALogger;
	
	import Lv_1.cross.IPlatformExtension;
	import Lv_1.cross.platforms.DesktopPlatform;
	import Lv_1.cross.platforms.IPlatform;
	import Lv_1.cross.platforms.MobilePlatform;
	import Lv_1.logging.DebugLogger;
	
public class CommonPlatformExtension implements IPlatformExtension {
	
	public function CommonPlatformExtension(stage:Stage){
		_stage = stage;
	}
	
	public function platform() : IPlatform {
		if(Multitouch.maxTouchPoints == 0){
			return new DesktopPlatform(false);
		}
		return new MobilePlatform(false, true);
	}
	
	public function logger() : ALogger {
		var logger_A:ALogger;
		
//		logger_A = new FlashTextLogger(_stage, false, 80, 465, 400, true);
		
		logger_A = new DebugLogger;
		
		return logger_A;
	}
	
	
	
	private var _stage:Stage;
}
}