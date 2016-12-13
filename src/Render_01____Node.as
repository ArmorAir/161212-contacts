package {
	import flash.display.Sprite;
	
	import Lv_1.Axime;
	
	import launch.CommonPlatformExtension;
	import launch.CommonUniformLauncher;
	
	[SWF(width = "450", height = "800", backgroundColor = "0x0", frameRate = "60")]
public class Render_01____Node extends Sprite {
	
	public function Render_01____Node() {
		Axime.startup(stage, new CommonUniformLauncher, new CommonPlatformExtension(stage));
	}
}
}