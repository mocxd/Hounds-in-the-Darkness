package entities.particles 
{
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import utils.VMath;
	/**
	 * ...
	 * @author x01010111
	 */
	public class Exhaust extends AxSprite
	{
		private var _animSpeed:int = 6;
		private var _speed:int = 50;
		private var _animations:Array = new Array("0", "1", "2", "3", "4", "5", "6", "7")
		
		public function Exhaust() 
		{
			super(0, 0);
			load(Registry.PRT_exhaust, 1, 1);
			addAnimation("0", [0, 1, 2, 3, 4, 5, 6, 7], _animSpeed, false, animationFinished);
			addAnimation("1", [8, 9, 10, 11, 12, 13, 14, 15], _animSpeed, false, animationFinished);
			addAnimation("2", [16, 17, 18, 19, 20, 21, 22, 23], _animSpeed, false, animationFinished);
			addAnimation("3", [24, 25, 26, 27, 28, 29, 30, 31], _animSpeed, false, animationFinished);
			addAnimation("4", [32, 33, 34, 35, 36, 37, 38, 39], _animSpeed, false, animationFinished);
			addAnimation("5", [40, 41, 42, 43, 44, 45, 46, 47], _animSpeed, false, animationFinished);
			addAnimation("6", [48, 49, 50, 51, 52, 53, 54, 55], _animSpeed, false, animationFinished);
			addAnimation("7", [56, 57, 58, 59, 60, 61, 62, 63], _animSpeed, false, animationFinished);
			exists = false;
		}
		
		public function fire(X:int, Y:int , ANGLE:Number, PARENTVEL:AxPoint):void
		{
			scale.x = scale.y = 3;
			exists = true;
			x = X; 
			y = Y;
			angle = ANGLE;
			velocity = VMath.velocityFromAngle(ANGLE + 180, _speed);
			velocity.x += Math.random() * 10 - 5 + PARENTVEL.x;
			velocity.y += Math.random() * 10 - 5 + PARENTVEL.y;
			animate(_animations[Math.floor(Math.random()*8)], true);
		}
		
		public function animationFinished():void
		{
			exists = false;
		}
		
		override public function update():void
		{
			scale.x -= 0.05;
			scale.y -= 0.05;
			
			super.update();
		}
		
	}

}