extends StaticBody2D

onready var bottom_right = get_node("BottomRightMarker")
onready var camera = Utils.get_main_node().get_node("Camera2D")

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	if camera == null: return
	
	if bottom_right.global_position.x <= camera.get_total_pos().x :
		queue_free()
	pass
