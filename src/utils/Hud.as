package utils 
{
	import org.axgl.*;
	import org.axgl.text.AxText;
	import org.axgl.input.AxMouseButton;
	/**
	 * ...
	 * @author x01010111
	 */
	public class Hud extends AxGroup
	{
		private var _navText:AxText;
		private var _navBox:AxSprite;
		private var _padding:int = 10;
		
		public function Hud() 
		{
			addBoxes();
			addElements();
		}
		
		public function addBoxes():void
		{
			_navBox = new AxSprite(5, 5);
			_navBox.create(120, 56, 0x50FFFFFF);
			_navBox.noScroll();
			add(_navBox);
		}
		
		public function addElements():void
		{
			_navText = new AxText(_navBox.x + _padding, _navBox.y + _padding, null, "Velocity", _navBox.width - _padding * 2, "left");
			_navText.alpha = 0.5;
			_navText.noScroll();
			add(_navText);
		}
		
		override public function update():void
		{
			navUpdate();
			
			super.update();
		}
		
		public function navUpdate():void
		{
			_navText.text = "Velocity: " + VMath.vectorVelocity(Registry.player.velocity.x, Registry.player.velocity.y) + "m/s";
			_navText.text += "\nAngle: " + VMath.toRelAngle(Registry.player.angle);
			_navText.text += "\nVectorAngle: " + VMath.toRelAngle((Math.atan2(Registry.player.velocity.y, Registry.player.velocity.x)) * 180 / Math.PI);
		}
		
	}

}