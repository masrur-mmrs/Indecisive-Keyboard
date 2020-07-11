extends Area2D

export var damage = 50
export var knockback = 300

func _on_Fireball_body_entered(body):
	$StateMachine.change_to("Exploding")
	if body.has_method("hit"):
		body.hit(damage, knockback, global_position)
