package  
{
	import entities.Player;
	/**
	 * This Registry file is set up for 
	 * easy embedding of project assets.
	 * 
	 * @author	01010111
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
		
		//CSV MAPS - [Embed(source = "../assets/maps/<>.csv", mimeType = "application/octet-stream")] public static var <>:Class;
		
		//MUSIC - [Embed(source = "../assets/music/<>.xm", mimeType = "application/octet-stream")] public static var <>:Class;
		
		/*SOUND - [Embed(source = '../assets/sounds/<>.mp3')] public static var <>:Class;
		 * 16bit frequency - 22050 128kbs MP3
		 */
		
		 //VARIABLES - public static var <>:<>;
		public static var player:Player;
		
		public function Registry() 
		{
			
		}
		
	}

}