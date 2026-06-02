package flixel.engine.play.nodes.button;

import flixel.engine.util.Constants;
import flixel.input.FlxPointer;
import flixel.input.IFlxInput;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;

class ButtonNode extends FlxButton
{
	override public function new(x:Float = 0, y:Float = 0, ?text:String, ?onClick:Void->Void, ?scale:Null<Float>)
	{
		super(x, y, text, onClick);

		setScale(scale ?? Constants.DEFAULT_SPRITE_SCALE);
	}

	public function setScale(scale:Float, ?refreshLabelOffsets:Bool = true)
	{
		this.scale.set(scale, scale);

		label.scale.set(scale, scale);
		label.updateHitbox();

		if (refreshLabelOffsets)
			this.refreshLabelOffsets();

		resetHelpers();
		updateHitbox();
	}

	public static var labelOffsetsList:Map<FlxPoint, Array<FlxPoint>> = [
		FlxPoint.get(1, 1) => [FlxPoint.get(0, 2), FlxPoint.get(0, 2), FlxPoint.get(0, 3), FlxPoint.get(0, 2)],
		FlxPoint.get(2, 2) => [FlxPoint.get(0, 5), FlxPoint.get(0, 5), FlxPoint.get(0, 6), FlxPoint.get(0, 5)],
	];

	public function refreshLabelOffsets()
	{
		labelOffsets = [];

		if (labelOffsetsList.exists(scale))
			labelOffsets = labelOffsetsList.get(scale);

		if (labelOffsets.length < 1)
		{
			for (key => value in labelOffsetsList)
			{
				if (labelOffsets.length > 0)
					continue;

				if (scale.x == key.x
					&& scale.y == key.y
					|| Math.floor(scale.x) == Math.floor(key.x)
					&& Math.floor(scale.y) == Math.floor(key.y))
					labelOffsets = value;
			}
		}
	}

	override function updateLabelPosition()
	{
		if (_spriteLabel != null) // Label positioning
		{
			_spriteLabel.x = (pixelPerfectPosition ? Math.floor(x) : x) + labelOffsets[status.toInt()]?.x ?? 0;
			_spriteLabel.y = (pixelPerfectPosition ? Math.floor(y) : y) + labelOffsets[status.toInt()]?.y ?? 0;
		}
	}

	override function checkInput(pointer:FlxPointer, input:IFlxInput, justPressedPosition:FlxPoint, camera:FlxCamera):Bool
	{
		if (pointer.overlaps(this))
		{
			updateStatus(input);
			return true;
		}
		else
		{
			currentInput = null;
		}

		return false;
	}
}
