extends RayCast2D

var origin: Node2D
var target: Node2D

func _process(_delta):
	if origin == null:
		return
	if target == null:
		target = Globals.player
		return
	position = origin.global_position
	if target != null:
		cast_to = target.global_position - origin.global_position
