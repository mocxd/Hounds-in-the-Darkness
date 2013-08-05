package entities 
{
	import org.axgl.*;
	/**
	 * ...
	 * @author mocxd
	 */
	public class EnemyManager extends AxGroup
	{
		
		public function EnemyManager() 
		{
			super();
		}
		
		public function addEnemy(_enemy:Enemy) {
			Registry.cuteDebugInfo.addLine("Enemy spawned. (" + (this.members.length+1).toString() + " on screen)");
			super.add(_enemy);
		}
		
		public function addRandomEnemy():void {
			addEnemy(new Enemy(Math.floor(Math.random() * Ax.width), Math.floor(Math.random() * Ax.height), getRandomEnemyType()));
		}
		
		public function getRandomEnemyType():String {
			var _tn:int = Math.floor(Math.random() * Enemy.MAX_TYPES);
			
			switch (_tn) {
				case 0:
					return Enemy.TYPE_A;
				case 1:
					return Enemy.TYPE_B;
				default:
					return Enemy.TYPE_DEFAULT;
			}
			
			
		}
		
	}

}