package 
{
	import flash.system.Capabilities;
	import org.axgl.Ax;
	
	/**
	 * ...
	 * @author x01010111
	 */
	public class Main extends Ax 
	{
		
		public function Main():void 
		{
			super(GameState, Capabilities.screenResolutionX, Capabilities.screenResolutionY, 1, 60);
		}
		
	}
	
}