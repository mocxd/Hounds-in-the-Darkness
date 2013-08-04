package  
{
	import entities.Player;
	import entities.Enemy;
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
			
			//Add Player from Registry
			Registry.player = new Player();
			add(Registry.player);
			
			//Populate some test enemies
			Registry.enemyGroup = new AxGroup();
			Registry.enemyGroup.add(new Enemy(20, 30, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(100, 100, Enemy.TYPE_A));
			Registry.enemyGroup.add(new Enemy(200, 300, Enemy.TYPE_B));
			add(Registry.enemyGroup);
			
			//Add basic HUD - will prob. need its own Class later
			_hud = new AxText(Ax.width - 100, Ax.height - 36, null, "Velocity", 100, "left");
			_hud.alpha = 0.5;
			add(_hud);
		}
		
		override public function update():void
		{
			hudUpdate();
			
			super.update();
		}
		
		public function hudUpdate():void
		{
			_hud.text = "Velocity: " + VMath.vectorVelocity(Registry.player.velocity.x, Registry.player.velocity.y) + "m/s";
			_hud.text += "\nAngle: " + VMath.toRelAngle(Registry.player.angle);
			_hud.text += "\nVectorAngle: " + VMath.toRelAngle((Math.atan2(Registry.player.velocity.y, Registry.player.velocity.x)) * 180 / Math.PI);
		}
		
	}

}
