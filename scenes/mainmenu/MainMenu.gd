extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_BtnAbout_button_up():
	var scene = load(GameVars.PREFABS_ABOUT)
	var node = scene.instance()
	get_tree().get_current_scene().add_child(node)


func _on_BtnSetting_button_up():
	var scene = load(GameVars.PREFABS_SETTING)
	var node = scene.instance()
	get_tree().get_current_scene().add_child(node)
