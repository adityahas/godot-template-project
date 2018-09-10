extends Node

func _ready():
	Game.connect("pause_game", self, "_on_game_paused")
	Game.connect("resume_game", self, "_on_game_resumed")

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

func _on_game_paused():
	get_tree().paused = true

func _on_game_resumed():
	get_tree().paused = false

func _on_BtnPlay_button_up():
	Game.emit_signal("resume_game")
	get_node("MainMenu/AnimationPlayer").play("exit")
