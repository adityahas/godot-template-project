extends Node2D

var scn_obstacle = preload("res://scenes/gameplay/Obstacle.tscn")
var last_spawn_location = 0
const GROUND_HEIGHT = 93
const SPAWN_DISTANCE = 500
const RAND_DISTANCE = 100
const OBJ_WIDTH_OFFSET = -100
const ARROW_FLY_HEIGHT = 100

func _ready():
	Game.connect("start_game", self, "_on_game_started")
	set_process(true)
	pass

func _on_game_started():
	spawn()

func _process(delta):
	if Game.travel_distance - last_spawn_location > SPAWN_DISTANCE:
		last_spawn_location = Game.travel_distance
		spawn()
	pass

func spawn():
	randomize()
	var new_obj = scn_obstacle.instance()
	var obs_type = rand_range(0, 100)
	set_object_type(obs_type, new_obj)
	new_obj.position = Utils.get_main_node().get_node("MainCharacter").position
	new_obj.position.y = GameVars.SCREEN_HEIGHT - GROUND_HEIGHT
	new_obj.position.x += OBJ_WIDTH_OFFSET + GameVars.SCREEN_WIDTH + rand_range(0, RAND_DISTANCE)
	if obs_type < 30:
		new_obj.position.y -= ARROW_FLY_HEIGHT
	get_node("Container").add_child(new_obj)

func set_object_type(obs_type, new_obj):
	if obs_type < 30:
		new_obj.get_node("CollisionArrow").visible = true
		new_obj.get_node("CollisionArrow").disabled = false
	else:
		new_obj.get_node("CollisionFire").visible = true
		new_obj.get_node("CollisionFire").disabled = false