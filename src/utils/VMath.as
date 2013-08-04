package utils 
{
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
		
		public static function distance(x2:Number, x1:Number, y2:Number, y1:Number):Number {
			return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
		}
		
		
	}

}