extends Node2D

onready var loading_thread = Thread.new()
onready var done_loading_data = false
onready var anim_done = false

func _ready():
	StageManager.connect("stage_exit", self, "_on_exit")
	loading_thread.start(self, "load_data")
	set_process(true)
	pass

func _process(delta):
	if done_loading_data && anim_done && !StageManager.is_changing:
		StageManager.change_stage(GameVars.STAGE_MAIN_MENU)
	pass

func load_data(data):
	done_loading_data = true
	pass

func anim_end():
	anim_done = true
	pass
