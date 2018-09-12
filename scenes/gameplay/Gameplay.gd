extends Node

func _ready():
	StageManager.stage_current = GameVars.STAGE_GAMEPLAY

func _on_BtnAbout_button_up():
	var scene = load(GameVars.PREFABS_ABOUT)
	var node = scene.instance()
	get_tree().get_current_scene().add_child(node)
	SoundManager.play("SFX_ClickOn")


func _on_BtnSetting_button_up():
	var scene = load(GameVars.PREFABS_SETTING)
	var node = scene.instance()
	get_tree().get_current_scene().add_child(node)
	SoundManager.play("SFX_ClickOn")

func _on_BtnPlay_button_up():
	Game.emit_signal("start_game")
	get_node("MainMenu/AnimationPlayer").play("exit")
