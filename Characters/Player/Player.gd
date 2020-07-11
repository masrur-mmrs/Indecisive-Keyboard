extends KinematicBody2D

signal _health_updated(health)

export(float) var max_health = 100
onready var health = max_health setget _set_health

var fireball_unlocked := true
var invuln = false setget _set_invuln

func _ready():
	Globals.player = self

func hit(damage, _knockback, _hit_origin):
	if invuln:
		return
	health -= damage
	emit_signal("_health_updated", health)
	if health <= 0:
		if $StateMachine.state != $StateMachine/Dying:
			$StateMachine.change_to("Dying")

func activate_hyper_sword():
	health = max_health
	$Sword.become_hyper()

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("_health_updated", health)

func _set_invuln(value):
	invuln = value
	var enemy_bit = 1
	set_collision_layer_bit(enemy_bit, !invuln)
