extends RigidBody2D

func _ready():
	set_process_input(true)
	set_process(true)
	pass
	
func _process(delta):
	pass
	
func jump():
	linear_velocity = Vector2(linear_velocity.x, -300)
	pass
	
func _input(event):
	if event.is_action_pressed("jump") && linear_velocity.y == 0:
		jump()
