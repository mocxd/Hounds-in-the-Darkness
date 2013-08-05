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
			
			//Starfield
			add(new Starfield(200));
			
			//Debug info
			Registry.cuteDebugInfo = new CuteDebugText()
			add(Registry.cuteDebugInfo);
			
			//Adds Exhaust under sprites
			Registry.exhaust = new ParticleManager(Exhaust, 128);
			add(Registry.exhaust);
			
			//Add Player from Registry
			Registry.player = new Player();
			add(Registry.player);
			
			//Adds Enemy Manager, and Populate additional test enemies every 5 seconds
			Registry.enemyGroup = new EnemyManager();
			addTimer(5, Registry.enemyGroup.addRandomEnemy, 200);
			add(Registry.enemyGroup);
			
			//Adds Enemy's bullet manager
			Registry.enemyBulletGroup = new BulletManager();
			add(Registry.enemyBulletGroup);
			
			// HUD
			Registry.hud = new Hud();
			add(Registry.hud);
			
			Ax.camera.follow(Registry.player);
			Ax.camera.bounds = new AxRect(0, 0, Ax.width, Ax.height);
		}
		
		override public function update():void
		{
			super.update();
			
			Registry.enemyBulletGroup.gcBullets();
			
			if (Ax.keys.pressed(AxKey.NUMPADPLUS) && Ax.zoom < 10) Ax.zoom += 1;
			if (Ax.keys.pressed(AxKey.NUMPADMINUS) && Ax.zoom > 1) Ax.zoom -= 1;
		}
		
	}

}
