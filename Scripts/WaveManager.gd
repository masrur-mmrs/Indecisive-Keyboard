extends Node

signal new_wave_started(wave)

export var time_between_waves = 3
export var autostart = true

var current_wave = 0

func _ready():
	set_process(false)
	if autostart:
		set_process(true)
#		start()
		
func _process(_delta):
	if get_tree().get_nodes_in_group("enemy").size() <= 0:
		if $InterwaveTimer.time_left <= 0:
			$InterwaveTimer.start(time_between_waves)

#func start():
#	_next_wave()

func _next_wave():
	for spawner in get_tree().get_nodes_in_group("spawner"):
		spawner.start_wave(current_wave + 1)
	current_wave += 1
	Globals.current_wave = current_wave
	
	emit_signal("new_wave_started", current_wave)
