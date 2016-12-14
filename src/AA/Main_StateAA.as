package AA {
	
	import Lv_0.events.ANotification;
	
	import Lv_2.display.MorphAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.display.Scale9ImageAA;
	
	import utils.NotificationConfig;
	import utils.ViewConfig;
	
public class Main_StateAA extends StateAA
{
	public function Main_StateAA()
	{
		super();
	}
	
	override public function onEnter():void {
		var s9img:Scale9ImageAA;
		
		s9img = new Scale9ImageAA;
		s9img.textureId = "img/s9white.png";
		this.getFusion().addNode(s9img);
		s9img.width = this.getWindow().windowWidth;
		s9img.height = this.getWindow().windowHeight;
		
		// content
		_contentMo = this.getMorph().createMorph(new ContentA_StateAA);
		this.getFusion().addNode(_contentMo.getNode());
		
		// top tab
		this.getFusion().addNode(this.getMorph().createMorph(new TopTab_StateAA).getNode());
		
		// dialing
		_dialingMo = this.getMorph().createMorph(new Dialing_StateAA);
		this.getFusion().addNode(_dialingMo.getNode());
		
		
		
		this.registerNotification(NotificationConfig.REVERSE);
	}
	
	override public function onNotification(v:ANotification):void {
		if(v.getName() == NotificationConfig.REVERSE) {
			_isReverse = v.getData() as Boolean;
			if(_isReverse) {
				_contentMo.switchTo(new ContentB_StateAA);
			}
			else {
				_contentMo.switchTo(new ContentA_StateAA);
			}
		}
		
	}
	
	
	
	private var _contentMo:MorphAA;
	
	private var _dialingMo:MorphAA;
	
	private var _isReverse:Boolean;
	
	
}
}