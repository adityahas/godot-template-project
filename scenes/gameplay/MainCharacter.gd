extends KinematicBody2D

const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0
const WALK_SPEED = 160 # pixels/sec
const JUMP_SPEED = 480

var timer = 0.0
var linear_vel = Vector2()
var is_rolling = false

var jump_counter = 0
const MAX_JUMP = 2

func _ready():
	set_process_input(true)
	set_process(true)
	pass
	
func _physics_process(delta):
	if Game.game_is_running():
		Game.travel_distance = position.x

		# Apply Gravity
		linear_vel += delta * GRAVITY_VEC
		
		var target_speed = 1
		target_speed *= WALK_SPEED + Game.walk_speed
		linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)
		
		# Move and Slide
		linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
		
		if is_on_floor() && !is_rolling:
			get_node("AnimatedSprite").play("run")
			jump_counter = 0
		
		timer += delta
		if timer > 4:
			timer = 0
			Game.walk_speed += 30
			# Set run animation FPS
			get_node("AnimatedSprite").frames.set_animation_speed("run", get_node("AnimatedSprite").frames.get_animation_speed("run") + 1)	
	
func jump():
	print("jump")
	linear_vel.y = -JUMP_SPEED
	is_rolling = false
	get_node("AnimatedSprite").play("jump")
	get_node("CollisionShape2D").scale.y = 1

func roll():
	is_rolling = true
	get_node("AnimatedSprite").play("roll")
	get_node("CollisionShape2D").scale.y = 0.7

func run():
	is_rolling = false
	get_node("AnimatedSprite").play("run")
	get_node("CollisionShape2D").scale.y = 1
	
func _input(event):
	if event.is_action_pressed("jump"):
		if jump_counter < MAX_JUMP:
			jump()
			jump_counter += 1
	if is_on_floor() && Game.game_is_running():
		if event.is_action_pressed("roll"):
			roll()
		if event.is_action_released("roll"):
			run()