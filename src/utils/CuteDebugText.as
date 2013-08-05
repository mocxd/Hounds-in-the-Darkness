package utils 
{
	import org.axgl.*;
	import org.axgl.render.AxColor;
	import org.axgl.text.AxText;
	/**
	 * ...
	 * @author mocxd
	 */
	public class CuteDebugText extends AxGroup
	{		
		
		public const LINES_MAX:Number = 50;
		
		public function CuteDebugText()
		{
			addLine("Debug On");
		}
		
		override public function update():void
		{	
			_updateLogScroll();
			super.update();
		}
		
		public function addLine(_ln:String="----------------------"):void {
			var _t:AxText;
			_t = new AxText(0, this.members.length * 15, null, _ln + "\n", 640, "left");
			_t.alpha = 0.75;
			_t.color = new AxColor(1, 0, 0, _t.alpha);
			_t.addTimer(2, function ():void {  _t.alpha -= .05; _t.color = new AxColor(1, 0, 0, _t.alpha); if (_t.alpha <= 0.1) { _forceLogScroll(); } }, 15);
			add(_t);
		}
		
		private function _updateLogScroll():void {
			if (this.members.length > LINES_MAX) {
				remove(this.members["0"]);
				for (var _index:String in this.members) {
					this.members[_index].y -= 15;
				}
			}
		}
		
		private function _forceLogScroll():void {
			remove(this.members["0"]);
			for (var _index:String in this.members) {
				this.members[_index].y -= 15;
			}
		}
		
	}

}