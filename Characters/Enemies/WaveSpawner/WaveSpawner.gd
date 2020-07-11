extends Node2D

export var interval = 0.2
export(PackedScene) var spawnee

var _index = 0
var _amount = 0

func start_wave(amount):
	_amount = amount
	_spawn()
	$Timer.start(interval)

func _spawn():
	var spawnee_instance = spawnee.instance()
	add_child(spawnee_instance)

func _on_Timer_timeout():
	_spawn()
	_index += 1
	if _index >= _amount:
		$Timer.stop()
