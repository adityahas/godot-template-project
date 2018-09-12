extends Area2D

onready var bottom_right = get_node("BottomRightMarker")
onready var camera = Utils.get_main_node().get_node("Camera2D")
var is_active = true
var animations = ["alquran", "haji", "menolong", "puasa", "shodakoh", "zakat"]

func _ready():
	randomize()
	set_process(true)
	add_to_group(GameVars.GROUP_COINS)
	get_node("AnimatedSprite").animation = animations[rand_range(0, animations.size() - 1)]
	pass
	
func _process(delta):
	if camera == null: return
	if bottom_right.global_position.x <= camera.get_total_pos().x :
		queue_free()
	pass

func _on_Coin_body_entered(body):
	if is_active:
		is_active = false
		get_node("AnimationPlayer").play("exit")
		yield(get_node("AnimationPlayer"), "animation_finished")
		match get_node("AnimatedSprite").animation:
			"alquran" :
				Game.game_score += 10
			"haji" :
				Game.game_score += 20
			"menolong" :
				Game.game_score += 30
			"puasa" :
				Game.game_score += 40
			"shodakoh" :
				Game.game_score += 50
			"zakat" :
				Game.game_score += 60
		queue_free()
