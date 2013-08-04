package entities 
{
	import org.axgl.*;
	import org.axgl.input.*;
	import utils.VMath;
	/**
	 * ...
	 * @author x01010111
	 * @author mocxd
	 */
	public class Enemy extends AxSprite
	{
		//private var _speed:int = 5;
		
		public function Enemy(x:Number, y:Number) 
		{
			super(x, y, Registry.SPR_enemy, 7, 7);
			angle -= 90;  // makes it point up
			
		}
		
		override public function update():void
		{
			screenWrap();
			super.update();
		}
		
		public function screenWrap():void
		{
			if (x < 0 - width) x = Ax.width;
			else if (x > Ax.width + 1) x = 0 - width + 1;
			
			if (y < 0 - height) y = Ax.height;
			else if (y > Ax.height + 1) y = 0 - height + 1;
		}
	}

}