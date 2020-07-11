extends GameState

export(PackedScene) var fireball
export var spellcasting_state = "SpellCasting"
export var attacking_state = "Attacking"
export var rolling_state = "Rolling"

func input(event: InputEvent):
	if event.is_action_pressed("use_primary_spell"):
		fsm.change_to(spellcasting_state)
	elif event.is_action_pressed("roll"):
		fsm.change_to(rolling_state)
	
func _get_move_vector() -> Vector2:
	var move_vector := Vector2()
	if Input.is_action_pressed("move_right"):
		move_vector.x += 1
	if Input.is_action_pressed("move_left"):
		move_vector.x -= 1
	if Input.is_action_pressed("move_up"):
		move_vector.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vector.y += 1
	return move_vector
