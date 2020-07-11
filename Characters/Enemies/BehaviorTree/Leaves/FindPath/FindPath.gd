extends Leaf

export var target_key = "target"
export var path_key = "navigation_path"
export var player_pos_key = "player_pos"

func run():
	if Globals.navigation == null or !Globals.nav_enabled:
		fail()
		return
	
	var self_pos = tree.acting_body.global_position
	var player_pos = tree.context[player_pos_key]
	tree.context[path_key] = Globals.navigation.get_simple_path(self_pos, player_pos)
	tree.context[target_key] = tree.context[path_key][1]
	
	$Line2D.points = tree.context[path_key]
	
	success()
