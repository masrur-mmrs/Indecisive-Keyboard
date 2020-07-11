extends Leaf

export var player_pos_key = "player_pos"

func start():
	.start()
	$RayCast2D.origin = tree.acting_body

func run():
	if Globals.player == null or !Globals.nav_enabled:
		fail()
		return

	var collider = $RayCast2D.get_collider()
	
	if collider == null:
		fail()
		return

	if collider == Globals.player:
		tree.context[player_pos_key] = collider.global_position
		success()
		return
	else:
		fail()
		return
