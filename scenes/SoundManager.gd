extends Node

var sound_queue = []
var current_played_queued_sound_id = 0
var enable_music = true
var enable_sfx = true

func play_music(id):
	if enable_music:
		get_node(id).play()

func play(id):
	if enable_sfx:
		get_node(id).play()

func music_is_playing(id):
	return get_node(id).is_playing()

func stop_music(id):
	get_node(id).stop()