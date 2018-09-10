extends Node2D

const scn_ground = preload("res://scenes/Ground.tscn")
const GROUND_WIDTH = 1280
const AMOUNT_TO_FILL_VIEW = 2

func _ready():
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_and_move()
	pass

func spawn_and_move():
	spawn_ground()
	go_next_pos()
	pass

func spawn_ground():
	var new_ground = scn_ground.instance()
	new_ground.position = position
	new_ground.connect("tree_exited", self, "spawn_and_move")
	get_node("Container").add_child(new_ground)
	pass

func go_next_pos():
	position += Vector2(GROUND_WIDTH, 0)
	pass

