package  
{
	import entities.particles.*;
	import entities.Player;
	import entities.Enemy;
	import utils.Hud;
	import utils.VMath;
	import org.axgl.*;
	import org.axgl.render.AxColor;
	import org.axgl.text.AxText;
	import flash.display.StageDisplayState;
	/**
	 * ...
	 * @author x01010111
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
			
			//Adds Exhaust under sprites
			Registry.exhaust = new ParticleManager(Exhaust, 128);
			add(Registry.exhaust);
			
			//Add Player from Registry
			Registry.player = new Player();
			add(Registry.player);
			
			//Populate some test enemies
			Registry.enemyGroup = new AxGroup();
			Registry.enemyGroup.add(new Enemy(20, 30, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(100, 100, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(200, 300, Enemy.TYPE_B));
			Registry.enemyGroup.add(new Enemy(200, 200, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(500, 100, Enemy.TYPE_B));
			Registry.enemyGroup.add(new Enemy(100, 700, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(200, 800, Enemy.TYPE_B));
			Registry.enemyGroup.add(new Enemy(100, 300, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(300, 100, Enemy.TYPE_B));
			Registry.enemyGroup.add(new Enemy(600, 100, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(700, 300, Enemy.TYPE_B));
			Registry.enemyGroup.add(new Enemy(100, 600, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(200, 500, Enemy.TYPE_B));
			add(Registry.enemyGroup);
			
			//Debug info
			Registry.debugInfo = new AxText(0, 0, null, "Debug", 200, "left");
			Registry.debugInfo.alpha = 0.5;
			Registry.debugInfo.color = new AxColor(1, 0, 0);
			add(Registry.debugInfo);
			
			// HUD
			Registry.hud = new Hud();
			add(Registry.hud);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}
