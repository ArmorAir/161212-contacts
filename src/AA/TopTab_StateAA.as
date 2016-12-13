package AA
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
public class TopTab_StateAA extends StateAA
{
	public function TopTab_StateAA()
	{
		super();
	}
	
	override public function onEnter():void {
		var img_A:ImageAA;
		
		img_A = new ImageAA;
		img_A.textureId = "img/tab_1.png";
		this.getFusion().addNode(img_A);
		
		
		
	}
		

}

}