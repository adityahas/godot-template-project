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

func _on_BtnClose_button_up():
	get_node("AnimationPlayer").play("exit")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()

func _on_BtnInformasi_button_up():
	get_node("AnimationPlayer").play("exit")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()
	var scene = load(GameVars.PREFABS_INFORMASI)
	var node = scene.instance()
	get_tree().get_current_scene().add_child(node)