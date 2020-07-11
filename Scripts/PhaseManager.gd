class_name PhaseManager
extends Timer

enum Phase {
	MOVEMENT,
	COMBAT
}

export var active = true setget _set_active
export(Phase) var phase = Phase.MOVEMENT
export var min_time = 2.0
export var max_time = 5.0

func _ready():
	Globals.phase_manager = self
	
	one_shot = true
	
	var __ = connect("timeout", self, "_on_timeout")
	
	if active:
		_start_timer()

func _set_active(value):
	active = value
	if value:
		_start_timer()

func _start_timer():
#	print("Current phase: " + str(phase))
	start(rand_range(min_time, max_time))

func _on_timeout():
	if phase == Phase.MOVEMENT:
		phase = Phase.COMBAT
	else:
		phase = Phase.MOVEMENT
	_start_timer()
