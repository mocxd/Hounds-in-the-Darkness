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
			
		}
		
		override public function update():void
		{
			screenWrap();
			fullAttackPlayer();  // example AI state
			super.update();
		}
		
		public function screenWrap():void
		{
			if (x < 0 - width) x = Ax.width;
			else if (x > Ax.width + 1) x = 0 - width + 1;
			
			if (y < 0 - height) y = Ax.height;
			else if (y > Ax.height + 1) y = 0 - height + 1;
		}
		
		// Attack the player with full power, by turning and facing player, accelerating towards player, and firing weapons
		public function fullAttackPlayer():void
		{
			angle = angleToIntersectPlayer();
			if (distanceToPlayer() > 150) {
				accelerateShip(10);
			} else {
				stopMoving();
			}
			//Registry.debugInfo.text = "Distance: " + distanceToPlayer();
		}
		
		public function accelerateShip(spd:Number):void {
			acceleration.y = Math.sin(angle * (Math.PI / 180)) * spd;
			acceleration.x = Math.cos(angle * (Math.PI / 180)) * spd;
			drag = new AxVector(0, 0);
		}
		
		public function stopMoving():void {
				acceleration.x = 0;
				acceleration.y = 0;
				drag = new AxVector(Math.abs(velocity.x), Math.abs(velocity.y));
		}
		
		public function angleToIntersectPlayer():Number {
			var _dx:Number, _dy:Number;
			_dx = Registry.player.x - this.x;
			_dy = Registry.player.y - this.y;
			//Registry.debugInfo.text = _dx + ", " + _dy + "\n";
			//Registry.debugInfo.text += (Math.atan2(_dy,_dx)*(180/Math.PI)).toString();
			return Math.atan2(_dy,_dx)*(180/Math.PI);
		}
		
		public function distanceToPlayer():Number {
			return VMath.distance(Registry.player.x, this.x, Registry.player.y, this.y);
		}
	}

}