extends "res://Characters/Player/States/Motion/Motion.gd"

signal direction_changed(direction)

var PHASE = PhaseManager.Phase.MOVEMENT

export var move_speed = 150
export var idle_state = "Idle"

func enter():
	if Globals.phase_manager.phase != PHASE:
		fsm.back()
		return

func physics_process(_delta):
	if Globals.phase_manager.phase != PHASE:
		fsm.back()
		return
	
	var move_vector := _get_move_vector()
	
	if move_vector == Vector2.ZERO:
		fsm.change_to(idle_state)
		return
	
	_set_sprite_direction(move_vector)
	
	fsm.acting_body.move_and_slide(move_vector.normalized() * move_speed)

func _set_sprite_direction(move_vector: Vector2):
	if !fsm.context.has("direction"):
		fsm.context["direction"] = ""
		
	if move_vector.x > 0:
		_change_direction("right")
	elif move_vector.x < 0:
		_change_direction("left")
	elif move_vector.y < 0:
		_change_direction("up")
	elif move_vector.y > 0:
		_change_direction("down")
		
func _change_direction(direction: String):
	if fsm.context["direction"] != direction:
		fsm.context["direction"] = direction
		emit_signal("direction_changed", direction)
