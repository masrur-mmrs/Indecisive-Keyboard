extends "res://Characters/Player/States/Motion/Motion.gd"

export var walking_state = "Walking"

func process(_delta):
	if _get_move_vector() != Vector2.ZERO:
		fsm.change_to(walking_state)
