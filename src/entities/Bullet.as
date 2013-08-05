package entities 
{
	import org.axgl.Ax;
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import org.axgl.AxVector;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends AxSprite
	{
				
		public function Bullet(_p:AxPoint, _angle:Number, _spd) 
		{
			var _sprt:Class = Registry.SPR_bullet;
			var _w:int = 3, _h:int = 3;
			super(_p.x, _p.y, _sprt, _w, _h);
			this.exists = true;
			angle = _angle;
			acceleration.y = Math.sin(angle * (Math.PI / 180)) * _spd;
			acceleration.x = Math.cos(angle * (Math.PI / 180)) * _spd;
			drag = new AxVector(0, 0);
		}
		
		override public function update():void
		{
			edgeDie();
			super.update();
		}
		
		public function edgeDie():void
		{
			if (x < 0 - width) this.exists = false;
			else if (x > Ax.width + 1) this.exists = false;
			
			if (y < 0 - height) this.exists = false;
			else if (y > Ax.height + 1) this.exists = false;
		}
		
	}

}