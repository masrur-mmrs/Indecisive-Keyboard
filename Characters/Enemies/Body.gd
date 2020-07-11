extends KinematicBody2D

export var start_health = 100
export var damage = 10
export var knockback = 700

onready var health = start_health
var invuln = false

# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func hit(damage, knockback, hit_origin, self_hit=false):
	if !invuln:
		health -= damage
		$StateMachine.context["hit_origin"] = hit_origin
		$StateMachine.context["knockback_strength"] = knockback
		$StateMachine.change_to("Stagger")
		if !self_hit:
			invuln = true
		if health <= 0:
			die()

func die():
	invuln = true
	$StateMachine.change_to("Dying")


func _on_Stagger_state_entered():
	pass


func _on_BehaviorTree_state_entered():
	invuln = false


func _on_Hitbox_body_entered(body):
	if body.has_method("hit"):
		body.hit(damage, 0, global_position)
	hit(0, knockback, body.global_position, true)


func _on_Dying_state_entered():
	pass # Replace with function body.
