extends TrunkSM

export var move_state = "Move"

func _on_EmitSignal_signal_emitted():
	fsm.context = context
	fsm.change_to(move_state)
