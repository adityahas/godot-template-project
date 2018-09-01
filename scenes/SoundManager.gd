extends Node

var sound_queue = []
var current_played_queued_sound_id = 0

func play_music(id):
	if GameVars.enable_music:
		get_node(id).play()

func music_is_playing(id):
	return get_node(id).is_playing()

func play_sfx(id):
#	if GameVars.enable_sfx:
#		get_node("sfx").play(id)
	pass

func stop_music_all():
#	get_node("music_1").stop()
	pass

func stop_sfx_all():
#	get_node("sfx").stop_all()
	pass
