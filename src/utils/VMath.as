package utils 
{
	import entities.Player;
	import flash.text.engine.BreakOpportunity;
	import org.axgl.AxPoint;
	import org.axgl.AxVector;
	/**
	 * ...
	 * @author x01010111
	 */
	public class VMath 
	{
		
		public function VMath() {}
		
		// Changes angles like -90 to 270; 375 to 360
		public static function toRelAngle(angle:int):int {
			return Math.floor((angle % 360 + 360) % 360)
		}
		
		// Takes X and Y velocities and returns actual velocity
		public static function vectorVelocity(VX:int, VY:int):int {
			return Math.floor(Math.sqrt(Math.pow(VX, 2) + Math.pow(VY, 2)))
		}
		
		// Basic distance between two points (as Numbers)
		public static function distance(x2:Number, x1:Number, y2:Number, y1:Number):Number {
			return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
		}
		
		public static function velocityFromAngle(angle:int, speed:int):AxVector
		{
			var a:Number = asRadians(angle);
			var result:AxVector = new AxVector;
			result.x = int(Math.cos(a) * speed);
			result.y = int(Math.sin(a) * speed);
			return result;
		}
		
		public static function asRadians(angle:Number):Number
		{
			return angle * (Math.PI / 180);
		}
		
		public static function placeModule(PARENT:Player, MODULE:ModuleOffset):AxPoint
		{
			var _x:Number = PARENT.x + PARENT.width / 2 - 0.6;
			var _y:Number = PARENT.y + PARENT.height / 2 - 0.6;
			var _a:Number = asRadians(PARENT.angle - MODULE.a);
			return new AxPoint(_x + MODULE.r * Math.cos(_a), _y + MODULE.r * Math.sin(_a));
		}
		
		public static function ranMinMax(MIN:Number, MAX:Number):Number
		{
			return MIN + (Math.random()*MAX); 
		}
	}

}