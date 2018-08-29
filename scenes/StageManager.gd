extends CanvasLayer

signal stage_changed
signal stage_enter
signal stage_exit
var is_changing = false
var stage_current = game_stages.STAGE_SPLASH
var stage_prev
var stage_next

func _ready():
	connect("stage_changed", self, "_on_stage_changed")
	pass

func _on_stage_changed():
	pass

func change_stage(stage_path):
	if stage_path == null: return
	stage_next = stage_path
	if is_changing: return
	
	emit_signal("stage_exit")
	is_changing = true
	get_tree().get_root().set_disable_input(true)
	#fade to black
#	get_node("anim").play("fade_in")
#	yield(get_node("anim"), "finished")

	#change stage
	get_tree().change_scene(stage_next)
	emit_signal("stage_changed")
	stage_prev = stage_current
	stage_current = stage_next

	#fade from white
#	get_node("anim").play("fade_out")
#	yield(get_node("anim"), "finished")

	is_changing = false
	get_tree().get_root().set_disable_input(false)

	print("change stage to "+stage_path)
	pass

func get_stage_current():
	return stage_current

func get_stage_next():
	return stage_next

func get_stage_prev():
	return stage_prev