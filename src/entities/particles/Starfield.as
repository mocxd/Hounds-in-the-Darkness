package entities.particles 
{
	import org.axgl.*;
	import utils.VMath;
	/**
	 * ...
	 * @author x01010111
	 */
	public class Starfield extends AxGroup
	{
		//TO-DO - When we enlarge the playarea, change the X, Y random values to stage.width/height
		
		public function Starfield(Density:int) 
		{
			for (var i:int = 0; i < Density; i++) {
				var star:AxSprite = new AxSprite(Math.random() * Ax.width, Math.random() * Ax.height);
				var starColor:Number = (VMath.ranMinMax(80,120) << 24) | (255 << 16) | (255 << 8) | 255
				star.create(1, 1, starColor);
				var starScroll:Number = VMath.ranMinMax(0.01, 0.2);
				star.scroll = new AxPoint(starScroll, starScroll);
				star.active = false;
				add(star);
			}
		}
		
	}

}