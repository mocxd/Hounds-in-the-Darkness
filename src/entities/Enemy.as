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
		
		public static const TYPE_A:String = "a";
		public static const TYPE_B:String = "b";
		protected var xsize:Number;
		protected var ysize:Number;
		
		public function Enemy(x:Number, y:Number, type:String) 
		{
			var _sprt:Class;
			var _xsize:Number;
			var _ysize:Number;
			
			if (type == "a") {
				_sprt = Registry.SPR_enemy;
				_xsize, _ysize = 7, 7;
			} else if (type == "b") {
				_sprt = Registry.SPR_enemy2;
				_xsize, _ysize = 20, 20;
			} else {
				_sprt = Registry.SPR_enemy;
				_xsize, _ysize = 7, 7;
			}
			
			super(x, y, _sprt, _xsize, _ysize);
			xsize = _xsize;
			ysize = _ysize;
			angle -= 90;  // makes it point up
			
			acceleration.y = -5  //move it for fun
			
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