extends AnimatedSprite

export var walk_animation = "Walk"
var direction = "right"

func _on_MoveTowards_direction_changed(new_direction):
	if new_direction == direction:
		return
	direction = new_direction
	flip_h = !flip_h


func _on_EmitSignalMove_signal_emitted():
	play(walk_animation)


func _on_Dying_state_entered():
	play("Death")


func _on_Stagger_state_entered():
	material.set_shader_param("flashing", true)


func _on_Stagger_finished():
	material.set_shader_param("flashing", false)
