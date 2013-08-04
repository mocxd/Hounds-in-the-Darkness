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
		
		public function fireExhaust(POINT:AxPoint, ANGLE:Number, PARENTVELX:int, PARENTVELY:int):void
		{
			var parentVel:AxPoint = new AxPoint(PARENTVELX, PARENTVELY);
			
			if (getFirstAvailable())
			{
				particle(getFirstAvailable()).fire(POINT.x, POINT.y, ANGLE, parentVel);
			}
		}
		
		public function getFirstAvailable(ObjectClass:Class=null):AxEntity
		{
			var basic:AxEntity;
			var i:uint = 0;
			while(i < members.length)
			{
				basic = members[i++] as AxEntity;
				if((basic != null) && !basic.exists && ((ObjectClass == null) || (basic is ObjectClass)))
					return basic;
			}
			return null;
		}
	}

}