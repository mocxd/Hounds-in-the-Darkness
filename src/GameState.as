package  
{
	import entities.Player;
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
			Registry.player = new Player()
			add(Registry.player);
			
			//Add basic HUD - will prob. need its own Class later
			_hud = new AxText(Ax.width - 100, Ax.height - 24, null, "Velocity", 100, "left");
			_hud.alpha = 0.5
			add(_hud);
		}
		
		override public function update():void
		{
			hudUpdate();
			
			super.update();
		}
		
		public function hudUpdate():void
		{
			_hud.text = "Velocity: " + Math.floor(Math.sqrt((Registry.player.velocity.x * Registry.player.velocity.x) + (Registry.player.velocity.y * Registry.player.velocity.y))) + "m/s \nAngle: " + (Registry.player.angle % 360 + 360) % 360;
			_hud.x = Registry.player.x + Registry.player.width + 10;
			_hud.y = Registry.player.y;
		}
	}

}