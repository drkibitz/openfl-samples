package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import openfl.Assets;

/**
 * @author Joshua Granick
 * @author Philippe Elsass
 */
class Main extends Sprite
{
	private var bg:Background;
	private var fps:FPS;

	public function new()
	{
		super ();
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}

	function addedToStage(e)
	{
		Env.setup();
		stage.addEventListener(Event.RESIZE, resize);

		bg = new Background();
		bg.texture = Assets.getBitmapData("images/grass.png");
		bg.cols = 8;
		bg.rows = 12;
		bg.x = -50;
		bg.y = -50;
		bg.setSize(Env.width + 100, Env.height + 100);
		addChild(bg);

		addChild (new TileTest ());
		//addChild (new RectTest ()); // Does not support alpha or rotation
		// addChild (new BitmapTest ());
		//addChild (new TriangleTest ()); // Does not support rotation
		//addChild (new BlittingTest ());
		//addChild (new NoBatchTileTest ());

		fps = new FPS();
		addChild(fps);
		fps.addEventListener(MouseEvent.CLICK, toggleFPS);
	}

	function resize(e)
	{
		if (bg == null) return;

		if (Env.width > Env.height)
		{
			bg.cols = 12;
			bg.rows = 8;
		}
		else
		{
			bg.cols = 8;
			bg.rows = 12;
		}
		bg.setSize(Env.width + 100, Env.height + 100);
	}

	function toggleFPS(e)
	{
		stage.frameRate = 90 - stage.frameRate;
	}

}
