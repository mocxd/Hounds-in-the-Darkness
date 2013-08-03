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
			var a:Number = Registry.player.angle;
			var vx:int = Registry.player.velocity.x;
			var vy:int = Registry.player.velocity.y;
			_hud.text = "Velocity: " + Math.floor(Math.sqrt(Math.pow(vx, 2) + Math.pow(vy, 2))) + "m/s \nAngle: " + Math.floor((a % 360 + 360) % 360) + "\nVectorAngle: " + Math.floor((((Math.atan2(vy, vx)) * 180 / Math.PI) % 360 + 360) % 360);
			_hud.x = Registry.player.x + Registry.player.width + 10;
			_hud.y = Registry.player.y;
		}
	}

}
