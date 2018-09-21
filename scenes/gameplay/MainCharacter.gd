extends KinematicBody2D

var timer = 0.0
const MOTION_SPEED = 160 # Pixels/second

func _ready():
	set_process_input(true)
	set_process(true)
#	linear_velocity.x = Game.walk_speed
	pass
	
func _physics_process(delta):
	Game.travel_distance = position.x
	var motion = Vector2()

	if Game.game_is_running():
		motion = Vector2(1, 0)
		motion = motion.normalized() * (MOTION_SPEED + Game.walk_speed)
		move_and_slide(motion)
		timer += delta
		if timer > 4:
			timer = 0
			Game.walk_speed += 30
			get_node("AnimatedSprite").frames.set_animation_speed("run", get_node("AnimatedSprite").frames.get_animation_speed("run") + 1)
	
func jump():
#	linear_velocity.y -= 500
	pass
	
func _input(event):
#	if event.is_action_pressed("jump") && linear_velocity.y == 0 && Game.game_is_running():
#		jump()
	pass