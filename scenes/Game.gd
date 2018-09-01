extends Node

signal show_exit_confirmation
var show_exit_confirmation

func _ready():
	get_tree().set_auto_accept_quit(false)
	set_process(true)
	connect("show_exit_confirmation", self, "_show_exit_confirmation")
	pass
		

func _process(delta):
	pass

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST && get_node("TimerBackButtonAllowExit").get_time_left() > 0:
		emit_signal("show_exit_confirmation")
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST && !StageManager.is_changing:
		if StageManager.stage_current == GameVars.STAGE_MAIN_MENU:
			emit_signal("show_exit_confirmation")
		elif StageManager.stage_current != GameVars.STAGE_SPLASH:
			StageManager.change_stage(StageManager.stage_prev)

func _show_exit_confirmation():
	if !show_exit_confirmation:
		var scene = load(GameVars.PREFABS_EXIT_CONFIRMATION)
		var node = scene.instance()
		get_tree().get_current_scene().add_child(node)
		show_exit_confirmation = true