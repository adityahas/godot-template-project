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
	SoundManager.play("SFX_ClickOn")
	get_node("AnimationPlayer").play("exit")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()


func _on_BtnMusic_button_up():
	SoundManager.enable_music = !SoundManager.enable_music
	SoundManager.play("SFX_ClickOn")
	SoundManager.play_music("MusicTitle")
	if SoundManager.enable_music:
		get_node("PopUpFrame/VBoxContainer/BtnMusic").set("text", "Music : On")
	else:
		SoundManager.stop_music("MusicTitle")
		get_node("PopUpFrame/VBoxContainer/BtnMusic").set("text", "Music : Off")


func _on_BtnSFX_button_up():
	SoundManager.enable_sfx = !SoundManager.enable_sfx
	SoundManager.play("SFX_ClickOn")
	if SoundManager.enable_sfx:
		get_node("PopUpFrame/VBoxContainer/BtnSFX").set("text", "SFX : On")
	else:
		get_node("PopUpFrame/VBoxContainer/BtnSFX").set("text", "SFX : Off")
