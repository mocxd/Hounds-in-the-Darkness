package  
{
	import entities.particles.*;
	import entities.*;
	import utils.Hud;
	import utils.VMath;
	import utils.CuteDebugText;
	import org.axgl.*;
	import org.axgl.render.AxColor;
	import org.axgl.text.AxText;
	import flash.display.StageDisplayState;
	import org.axgl.input.*;
	/**
	 * ...
	 * @author x01010111
	 * @author mocxd
	 */
	public class GameState extends AxState
	{
		private var _hud:AxText;
		
		override public function create():void
		{
			//Make Fullscreen - See constructor in Main.as for getting width/height
			Ax.stage2D.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			//Background is already Black, but for quick access:
			Ax.background = new AxColor(0, 0, 0);
			
			//Debug info
			Registry.cuteDebugInfo = new CuteDebugText()
			add(Registry.cuteDebugInfo);
			
			//Adds Exhaust under sprites
			Registry.exhaust = new ParticleManager(Exhaust, 128);
			add(Registry.exhaust);
			
			//Add Player from Registry
			Registry.player = new Player();
			add(Registry.player);
			
			//Populate some test enemies
			Registry.enemyGroup = new EnemyManager();
			addTimer(5, Registry.enemyGroup.addRandomEnemy, 200);
			/*Registry.enemyGroup.addEnemy(new Enemy(20, 30, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(100, 100, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(200, 300, Enemy.TYPE_B));
			Registry.enemyGroup.addEnemy(new Enemy(200, 200, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(500, 100, Enemy.TYPE_B));
			Registry.enemyGroup.addEnemy(new Enemy(100, 700, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(200, 800, Enemy.TYPE_B));
			Registry.enemyGroup.addEnemy(new Enemy(100, 300, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(300, 100, Enemy.TYPE_B));
			Registry.enemyGroup.addEnemy(new Enemy(600, 100, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(700, 300, Enemy.TYPE_B));
			Registry.enemyGroup.addEnemy(new Enemy(100, 600, Enemy.TYPE_A));
			Registry.enemyGroup.addEnemy(new Enemy(200, 500, Enemy.TYPE_B));*/
			add(Registry.enemyGroup);
			
			// HUD
			Registry.hud = new Hud();
			add(Registry.hud);
			
			Ax.camera.follow(Registry.player);
			Ax.camera.bounds = new AxRect(0, 0, Ax.width, Ax.height);
		}
		
		override public function update():void
		{
			super.update();
			
			if (Ax.keys.pressed(AxKey.NUMPADPLUS) && Ax.zoom < 10) Ax.zoom += 1;
			if (Ax.keys.pressed(AxKey.NUMPADMINUS) && Ax.zoom > 1) Ax.zoom -= 1;
		}
		
	}

}
