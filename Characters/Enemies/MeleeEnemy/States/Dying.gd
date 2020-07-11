extends GameState

export var duration = 4
export var skull_door_group = "skull_door"

func enter():
	$Timer.start(duration)
	
	if _is_door_deletable():
		_delete_doors()

func _is_door_deletable() -> bool:
	var num_room_enemies = 0
	var room_group: String
	
	for group in fsm.acting_body.get_groups():
		if group != "enemy":
			room_group = group
			
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if enemy.is_in_group(room_group):
			num_room_enemies += 1
	
	if num_room_enemies > 1:
		return false
	else:
		return true

func _delete_doors():
	for door in get_tree().get_nodes_in_group(skull_door_group):
		for group in fsm.acting_body.get_groups():
			if door.is_in_group(group):
				door.queue_free()

func _on_Timer_timeout():
	fsm.acting_body.queue_free()
