package  
{
	import entities.Player;
	import org.axgl.AxGroup;
	import org.axgl.AxSprite;
	import org.axgl.text.AxText;
	import utils.Hud;
	/**
	 * This Registry file is set up for 
	 * easy embedding of project assets.
	 * 
	 * @author	01010111
	 * @author  mocxd
	 */
	
	public class Registry 
	{
		/*IMAGES - [Embed(source = "../assets/graphics/<>.png")] public static var <>:Class;
		 * Use the following prefixes to deliniate graphic type:
			 SPR_ - Sprites (player/enemy/door)
			 TIL_ - Tilemaps
			 GFX_ - Graphics (Background, Title Graphics)
			 PRT_ - Particles
		 */
		[Embed(source = "../assets/graphics/player.png")] public static var SPR_player:Class;
		[Embed(source = "../assets/graphics/enemy.png")] public static var SPR_enemy:Class;
		[Embed(source = "../assets/graphics/enemy2.png")] public static var SPR_enemy2:Class;
		[Embed(source = "../assets/graphics/bullet.png")] public static var SPR_bullet:Class;
		[Embed(source = "../assets/graphics/exhaust.png")] public static var PRT_exhaust:Class;
		
		//CSV MAPS - [Embed(source = "../assets/maps/<>.csv", mimeType = "application/octet-stream")] public static var <>:Class;
		
		//MUSIC - [Embed(source = "../assets/music/<>.xm", mimeType = "application/octet-stream")] public static var <>:Class;
		
		/*SOUND - [Embed(source = '../assets/sounds/<>.mp3')] public static var <>:Class;
		 * 16bit frequency - 22050 128kbs MP3
		 */
		
		 //VARIABLES - public static var <>:<>;
		public static var player:Player;
		public static var enemyGroup:AxGroup;
		public static var bulletGroup:AxGroup;
		public static var debugInfo:AxText;
		public static var hud:Hud;
		
		public function Registry() 
		{

		}
		
	}

}