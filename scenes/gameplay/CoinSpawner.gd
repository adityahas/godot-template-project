extends Node2D

const GROUND_HEIGHT = 110
const COIN_WIDTH_OFFSET = -100
var scn_coin = preload("res://scenes/gameplay/Coin.tscn")

func _ready():
	Game.connect("start_game", self, "_on_game_started")

func _on_game_started():
	init_spawner()
	spawn_and_move()

func init_spawner():
	randomize()
	var init_pos = Vector2()
	init_pos.x = get_viewport_rect().size.x
	init_pos.y = GameVars.SCREEN_HEIGHT - rand_range(GROUND_HEIGHT, GROUND_HEIGHT + 50)
	
	var camera = Utils.get_main_node().get_node("Camera2D")
	if camera:
		init_pos.x += camera.get_total_pos().x
	
	position = init_pos

func spawn_and_move():
	spawn_coin()
	move_to_next_position()

func spawn_coin():
	var new_coin = scn_coin.instance()
	new_coin.position = position
	new_coin.connect("tree_exited", self, "spawn_and_move")
	get_node("Container").add_child(new_coin)

func move_to_next_position():
	randomize()
	var next_pos = position
	var camera = Utils.get_main_node().get_node("Camera2D")
	next_pos.x += GameVars.SCREEN_WIDTH + COIN_WIDTH_OFFSET
	next_pos.y = GameVars.SCREEN_HEIGHT - rand_range(GROUND_HEIGHT, GROUND_HEIGHT + 50)
	position = next_pos
