extends GameState

signal finished

export var hit_origin_key = "hit_origin"
export var knockback_str_key = "knockback_strength"
export(float, 0, 1) var damping = 0.8
var hit_origin: Vector2
var velocity: Vector2

func enter():
	hit_origin = fsm.context[hit_origin_key]
	velocity = (fsm.acting_body.global_position - hit_origin).normalized()
	velocity *= fsm.context[knockback_str_key]

func physics_process(delta):
	velocity = fsm.acting_body.move_and_slide(velocity)
	velocity *= damping
	print(velocity.length())
	if velocity.length() <= 20:
		emit_signal("finished")
		fsm.back()
