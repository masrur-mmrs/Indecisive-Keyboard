extends Leaf

export var player_pos_key = "player_pos"

func run():
	if Globals.player == null:
		fail()
		return
	tree.context[player_pos_key] = Globals.player.global_position
	success()
