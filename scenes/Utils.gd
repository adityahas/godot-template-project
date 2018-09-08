extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_main_node():
	var root_node = get_tree().get_root()
	return root_node.get_child(root_node.get_child_count()-1)