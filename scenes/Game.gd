extends Node

signal pause_game
signal resume_game
signal start_game
signal show_exit_confirmation
var show_exit_confirmation
var game_state
var game_score = 0
var travel_distance = 0
var walk_speed = 50

func _ready():
	set_process(true)
	connect("show_exit_confirmation", self, "_show_exit_confirmation")
	connect("pause_game", self, "_on_game_paused")
	connect("resume_game", self, "_on_game_resumed")
	connect("start_game", self, "_on_game_started")
	pass

func _process(delta):
	pass

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST && get_node("TimerBackButtonAllowExit").get_time_left() > 0:
		emit_signal("show_exit_confirmation")
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST && !StageManager.is_changing:
		if StageManager.stage_current == GameVars.STAGE_GAMEPLAY:
			emit_signal("show_exit_confirmation")
		elif StageManager.stage_current != GameVars.STAGE_SPLASH:
			StageManager.change_stage(StageManager.stage_prev)

func _show_exit_confirmation():
	if !show_exit_confirmation:
		emit_signal("pause_game")
		SoundManager.play("SFX_ClickOn")
		var scene = load(GameVars.PREFABS_EXIT_CONFIRMATION)
		var node = scene.instance()
		get_tree().get_current_scene().add_child(node)
		show_exit_confirmation = true

func _on_game_paused():
	game_state = "paused"
	get_tree().paused = true

func _on_game_resumed():
	game_state = "resumed"
	get_tree().paused = false

func _on_game_started():
	game_state = "started"

func game_is_running():
	return (Game.game_state == "resumed" || Game.game_state == "started")