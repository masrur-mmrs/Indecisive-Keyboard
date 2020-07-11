extends AnimatedSprite

func _enter_tree():
	play("start")

func _on_Sprite_animation_finished():
	if animation == "start":
		play("moving")


func _on_Exploding_state_entered():
	play("explosion")
	get_node("explosion").play()
