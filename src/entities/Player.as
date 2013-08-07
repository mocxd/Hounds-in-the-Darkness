package entities 
{
	import flash.geom.Point;
	import mx.events.ModuleEvent;
	import org.axgl.*;
	import org.axgl.input.*;
	import utils.ModuleOffset;
	import utils.VMath;
	/**
	 * ...
	 * @author x01010111
	 */
	public class Player extends AxSprite
	{
		private var _speed:int = 5;
		private var _bowThrust:Boolean = true;
		
		public var rearThrust:Array = new Array(new ModuleOffset(180, 2));
		public var bowPortThrust:ModuleOffset = new ModuleOffset(21,3);
		public var sternPortThrust:ModuleOffset = new ModuleOffset(133, 4);
		public var bowStarboardThrust:ModuleOffset = new ModuleOffset(-21, 3);
		public var sternStarboardThrust:ModuleOffset = new ModuleOffset(-133, 4);
		
		public function Player() 
		{
			super(Ax.width / 2, Ax.height / 2, Registry.SPR_player, 7, 7);
			angle -= 90;
			
		}
		
		override public function update():void
		{
			super.update();
			playerControls();
			screenWrap();
		}
		
		public function playerControls():void
		{
			//Turning
			if (Ax.keys.down(AxKey.A)) angle -= 5;
			if (Ax.keys.down(AxKey.D)) angle += 5;
			if (Ax.keys.pressed(AxKey.A)) {
				Registry.exhaust.fireExhaust(VMath.placeModule(this, sternPortThrust), angle + 90, velocity.x, velocity.y, 2);
				Registry.exhaust.fireExhaust(VMath.placeModule(this, bowStarboardThrust), angle - 90, velocity.x, velocity.y, 2);
			} if (Ax.keys.released(AxKey.A)) {
				Registry.exhaust.fireExhaust(VMath.placeModule(this, bowPortThrust), angle + 90, velocity.x, velocity.y, 2);
				Registry.exhaust.fireExhaust(VMath.placeModule(this, sternStarboardThrust), angle - 90, velocity.x, velocity.y, 2);
			}
			if (Ax.keys.pressed(AxKey.D)) {
				Registry.exhaust.fireExhaust(VMath.placeModule(this, bowPortThrust), angle + 90, velocity.x, velocity.y, 2);
				Registry.exhaust.fireExhaust(VMath.placeModule(this, sternStarboardThrust), angle - 90, velocity.x, velocity.y, 2);
			} if (Ax.keys.released(AxKey.D)) {
				Registry.exhaust.fireExhaust(VMath.placeModule(this, sternPortThrust), angle + 90, velocity.x, velocity.y, 2);
				Registry.exhaust.fireExhaust(VMath.placeModule(this, bowStarboardThrust), angle - 90, velocity.x, velocity.y, 2);
			}
			
			if (!Ax.keys.down(AxKey.Q) && !Ax.keys.down(AxKey.W) && !Ax.keys.down(AxKey.E) && !Ax.keys.down(AxKey.S)) acceleration = new AxVector(0, 0);
			else {
				if (Ax.keys.down(AxKey.W)) {
					acceleration.y += Math.sin(angle * (Math.PI / 180)) * _speed;
					acceleration.x += Math.cos(angle * (Math.PI / 180)) * _speed;
					drag = new AxVector(0, 0);
					for (var i:int = 0; i < rearThrust.length; i++) {
						Registry.exhaust.fireExhaust(VMath.placeModule(this, rearThrust[i]), angle, velocity.x, velocity.y);
					}
				}
				if (Ax.keys.down(AxKey.S)) {
					acceleration = new AxVector(0, 0);
					drag = new AxVector(Math.abs(velocity.x), Math.abs(velocity.y));
				} else {
					if (VMath.vectorVelocity(velocity.x, velocity.y) > 1 ) drag = new AxVector(0, 0);
					else drag = new AxVector(100, 100);
				}
				if (Ax.keys.down(AxKey.Q) && !Ax.keys.down(AxKey.E)) {
					acceleration.y += Math.sin(VMath.toRelAngle(angle - 90) * (Math.PI / 180)) * _speed;
					acceleration.x += Math.cos(VMath.toRelAngle(angle - 90) * (Math.PI / 180)) * _speed;
					drag = new AxVector(0, 0);
					if (_bowThrust) {
						Registry.exhaust.fireExhaust(VMath.placeModule(this, bowStarboardThrust), angle - 90, velocity.x, velocity.y, 2);
						_bowThrust = false;
					} else {
						Registry.exhaust.fireExhaust(VMath.placeModule(this, sternStarboardThrust), angle - 90, velocity.x, velocity.y, 2);
						_bowThrust = true;
					}
				}
				if (Ax.keys.down(AxKey.E) && !Ax.keys.down(AxKey.Q)) {
					acceleration.y += Math.sin(VMath.toRelAngle(angle + 90) * (Math.PI / 180)) * _speed;
					acceleration.x += Math.cos(VMath.toRelAngle(angle + 90) * (Math.PI / 180)) * _speed;
					drag = new AxVector(0, 0);
					if (_bowThrust) {
						Registry.exhaust.fireExhaust(VMath.placeModule(this, bowPortThrust), angle + 90, velocity.x, velocity.y, 2);
						_bowThrust = false;
					} else {
						Registry.exhaust.fireExhaust(VMath.placeModule(this, sternPortThrust), angle + 90, velocity.x, velocity.y, 2);
						_bowThrust = true;
					}
				}
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