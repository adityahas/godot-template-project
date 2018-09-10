extends Node2D

const GROUND_HEIGHT = 72
var scn_coin = preload("res://scenes/gameplay/Coin.tscn")

func _ready():
	Game.connect("resume_game", self, "_on_game_resumed")

func _on_game_resumed():
	init_spawner()
	spawn_and_move()

func init_spawner():
	randomize()
	
	var init_pos = Vector2()
	init_pos.x = get_viewport_rect().size.x
	init_pos.y = rand_range(GROUND_HEIGHT, GROUND_HEIGHT + 50)
	
	var camera = Utils.get_main_node().get_node("Camera2D")
	if camera:
		init_pos.x += camera.get_total_pos().x
	
	position = init_pos

func spawn_and_move():
	spawn_coin()
	move_next_position()

func spawn_coin():
	var new_coin = scn_coin.instance()
	new_coin.position = position
	new_coin.connect("tree_exited", self, "spawn_and_move")
	get_node("Container").add_child(new_coin)

func move_next_position():
	randomize()
	var next_pos = position
	var camera = Utils.get_main_node().get_node("Camera2D")
	next_pos.x += camera.get_total_pos().x + rand_range(0, 200)
	next_pos.y = rand_range(GROUND_HEIGHT, GROUND_HEIGHT + 50)
	position = next_pos
