extends Control

func _on_ButtonYes_button_up():
	SoundManager.play("SFX_ClickOn")
	get_node("AnimationPlayer").play("exit")
	yield(get_node("AnimationPlayer"), "animation_finished")
	get_tree().quit()


func _on_ButtonNo_button_up():
	SoundManager.play("SFX_ClickOn")
	Game.show_exit_confirmation = false
	get_node("AnimationPlayer").play("exit")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()