package entities 
{
	import org.axgl.*;
	import org.axgl.input.*;
	/**
	 * ...
	 * @author x01010111
	 */
	public class Player extends AxSprite
	{
		private var _speed:int = 5;
		
		public function Player() 
		{
			super(Ax.width / 2, Ax.height / 2, Registry.SPR_player, 21, 21);
			angle -= 90;
			
		}
		
		override public function update():void
		{
			playerControls();
			screenWrap();
			super.update();
		}
		
		public function playerControls():void
		{
			if (Ax.keys.down(AxKey.LEFT)) angle -= 5;
			if (Ax.keys.down(AxKey.RIGHT)) angle += 5;
			if (Ax.keys.down(AxKey.UP)) {
				acceleration.y += Math.sin(angle * (Math.PI / 180)) * _speed;
				acceleration.x += Math.cos(angle * (Math.PI / 180)) * _speed;
				drag = new AxVector(0, 0);
			} else if (Ax.keys.down(AxKey.DOWN)) {
				acceleration = new AxVector(0, 0);
				drag = new AxVector(velocity.x, velocity.y);
			}
			else {
				acceleration = new AxVector(0, 0);
				drag = new AxVector(100, 100);
			}
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