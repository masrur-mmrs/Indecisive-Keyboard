class_name PhaseManager
extends Timer

signal updated_timer(duration)
signal phase_changed(phase)

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

	emit_signal("phase_changed", phase)
	_start_timer()


# warning-ignore:unused_argument
func _process(delta):
	emit_signal("updated_timer", time_left)
