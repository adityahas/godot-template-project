extends Control

func _on_ButtonYes_button_up():
	get_tree().quit()
	pass # replace with function body


func _on_ButtonNo_button_up():
	Game.show_exit_confirmation = false
	get_node("AnimationPlayer").play("exit")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()
	pass # replace with function body
