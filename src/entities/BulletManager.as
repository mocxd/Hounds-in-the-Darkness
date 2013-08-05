package entities 
{
	import org.axgl.*;
	/**
	 * ...
	 * @author ...
	 */
	public class BulletManager extends AxGroup
	{
		
		public function BulletManager() 
		{
			super();
		}
		
		public function fireAtAngle(_startpoint:AxPoint, _angle:Number):void {
			Registry.cuteDebugInfo.addLine("Enemy fired! (" + (this.members.length + 1).toString() + " enemy bullets on screen)");
			super.add(new Bullet(_startpoint, _angle, 300));
		}
		
		public function gcBullets():void {
			for (var _ind:String in this.members) {
				if (!this.members[_ind].exists) {
					Registry.cuteDebugInfo.addLine("Removed enemy bullet index " + _ind);
					remove(this.members[_ind]);
				}
			}
		}
		
	}

}