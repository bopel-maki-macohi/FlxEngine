package flixel.engine.menus.editor.screens.notloaded;

import flixel.engine.play.nodes.button.ButtonNode;
import flixel.engine.play.nodes.text.InputLabelNode;
import flixel.engine.play.nodes.text.TextNode;

class EditorNewProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.newProject', parent);
	}

	var label:TextNode;

	var projectNameInput:InputLabelNode;
	var projectAuthorInput:InputLabelNode;
	var projectDescriptionInput:InputLabelNode;

	var createButton:ButtonNode;

	override function create()
	{
		super.create();

		label = new TextNode(0, parent.leaveIcon.y + parent.leaveIcon.height, FlxG.width, 'NEW PROJECT', 32);
		add(label);
		label.alignment = CENTER;

		projectNameInput = new InputLabelNode(0, 0, FlxG.width / 2, 'Project Name', 16);
		add(projectNameInput);
		projectNameInput.screenCenter();
		projectNameInput.y -= projectNameInput.height * 2;

		projectAuthorInput = new InputLabelNode(0, 0, FlxG.width / 2, 'Project Author', 16);
		add(projectAuthorInput);
		projectAuthorInput.screenCenter(X);
		projectAuthorInput.y = projectNameInput.y + projectAuthorInput.height;

		projectDescriptionInput = new InputLabelNode(0, 0, FlxG.width / 2, 'Project Description', 16);
		add(projectDescriptionInput);
		projectDescriptionInput.fieldHeight = FlxG.height / 4;
		projectDescriptionInput.screenCenter(X);
		projectDescriptionInput.y = projectAuthorInput.y + projectAuthorInput.height;
		projectDescriptionInput.wordWrap = projectDescriptionInput.multiline = true;

		createButton = new ButtonNode(0, 0, 'Create Project', onCreateClicked);
		add(createButton);
		createButton.screenCenter(X);
		createButton.y = FlxG.height - createButton.height * 2;

		generatedProject = new EditorProject();
	}

	var generatedProject:EditorProject;

	function onCreateClicked()
	{
		generatedProject.name = projectNameInput.text;
		generatedProject.author = projectAuthorInput.text;
		generatedProject.description = projectDescriptionInput.text;

		EditorProject.addProject(generatedProject);

		parent.screen_loadProject.reloadProjects();

		parent.project = generatedProject;
		parent.setCurrentScreen(parent.screen_project.id);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
			parent.setCurrentScreen(parent.screen_noProject.id);
	}
}
