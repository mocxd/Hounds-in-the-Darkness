package  
{
	import entities.Player;
	import org.axgl.*;
	import org.axgl.render.AxColor;
	import org.axgl.text.AxText;
	/**
	 * ...
	 * @author x01010111
	 */
	public class GameState extends AxState
	{
		override public function create():void
		{
			Ax.background = new AxColor(0, 0, 0);
			add(new Player());
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}