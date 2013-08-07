package entities.particles 
{
	import org.axgl.*;
	/**
	 * ...
	 * @author x01010111
	 */
	public class ParticleManager extends AxGroup
	{
		
		private var particle:Class;
		
		public function ParticleManager(PARTICLE:Class, PRT_AMT:int) 
		{
			super()
			
			particle = PARTICLE;
			
			for (var i:int = 0; i < PRT_AMT; i++)
			{
				add(new PARTICLE());
			}
		}
		
		public function fireExhaust(POINT:AxPoint, ANGLE:Number, PARENTVELX:int, PARENTVELY:int, SIZE:int = 3):void
		{
			var parentVel:AxPoint = new AxPoint(PARENTVELX, PARENTVELY);
			var exhaust:Exhaust = recycle() as Exhaust;
			if (exhaust != null) exhaust.fire(POINT.x, POINT.y, ANGLE, parentVel, SIZE);
		}
	}

}