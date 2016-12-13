package AA.comps
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.MorphAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.display.advanced.DragFusionAA;

	public class ContentList_StateAA extends StateAA
	{
		
		public var listHeight : Number;
		
		
		override public function onEnter():void {
			var img:ImageAA;
			
			img = new ImageAA;
			img.textureId = "img/content_A.png";
			this.getFusion().addNode(img);
//			img.y = 250;
			
			img = new ImageAA;
			img.textureId = "img/content_A.png";
			this.getFusion().addNode(img);
			img.y = img.getSourceHeight();
			
			this.listHeight = img.getSourceHeight() * 2;
			
		}
		
		
		
	}
}