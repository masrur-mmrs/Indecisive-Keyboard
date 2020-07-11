extends Leaf

export var target_key := "target"
export var speed := 150.0

signal direction_changed(new_direction)

var direction = "right"

func run():
	if !tree.context.has(target_key):
		fail()
		return
	
	var origin: Vector2 = tree.acting_body.global_position
	var target: Vector2 = tree.context[target_key]
	
	var move_vector = (target - origin).normalized() * speed
	
	_set_direction(move_vector)
	
	tree.acting_body.move_and_slide(move_vector)
	success()


func _set_direction(move_vector: Vector2):
	if move_vector.x > 0 and direction != "right":
		direction = "right"
		emit_signal("direction_changed", direction)
	elif move_vector.x < 0 and direction != "left":
		direction = "left"
		emit_signal("direction_changed", direction)
