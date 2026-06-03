package flixel.engine.menus.debug;

import flixel.engine.play.nodes.sprite.NotificationSpriteNode;
import flixel.engine.play.nodes.state.StateNode;

class NotificationTest extends StateNode
{
    var notification:NotificationSpriteNode;

	override function create()
	{
		super.create();

        notification = new NotificationSpriteNode('Lorem Ipsum', 'popup/download');
        add(notification);
        notification.screenCenter();
	}
}
