extends GameState

export var speed = 500
export var roll_duration = 0.67
export var cooldown_duration = 0.5

var rolling = false
var velocity: Vector2

func enter():
	if !$CooldownTimer.is_stopped():
		fsm.back()
		return
	
	_set_initial_velocity()
	$RollTimer.start(roll_duration)
	rolling = true
	fsm.acting_body.invuln = true

func physics_process(delta):
	var acting_body: KinematicBody2D = fsm.acting_body
	var collision := acting_body.move_and_collide(velocity * delta)
	
	if collision != null:
		_exit()

func _set_initial_velocity():
	var move_vector := Vector2()
	if Input.is_action_pressed("move_right"):
		move_vector.x += 1
	if Input.is_action_pressed("move_left"):
		move_vector.x -= 1
	if Input.is_action_pressed("move_up"):
		move_vector.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vector.y += 1
	if move_vector == Vector2.ZERO:
		move_vector = Vector2.RIGHT
	velocity = move_vector.normalized() * speed

func _exit():
	if !rolling:
		return
	rolling = false
	$RollTimer.stop()
	$CooldownTimer.start(cooldown_duration)
	fsm.acting_body.invuln = false
	fsm.back()


func _on_RollTimer_timeout():
	_exit()
