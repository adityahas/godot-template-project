extends Camera2D

onready var mc = Utils.get_main_node().get_node("MainCharacter")

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	position = Vector2(mc.position.x, position.y)
	pass
	
func get_total_pos():
	return position + offset
