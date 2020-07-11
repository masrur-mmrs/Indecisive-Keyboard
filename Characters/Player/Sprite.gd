extends AnimatedSprite

const walk_animations = {
	"up": "walk_up",
	"down": "walk_down",
	"left": "walk_left",
	"right": "walk_right"
}
const fireball_animations = {
	"up": "fireball_up",
	"down": "fireball_down",
	"left": "fireball_left",
	"right": "fireball_right"
}
const roll_animations = {
	"up": "roll_up",
	"down": "roll_down",
	"left": "roll_left",
	"right": "roll_right"
}

var direction := "down"


func _on_Walking_direction_changed(new_direction):
	direction = new_direction
	animation = walk_animations[direction]


func _on_Walking_state_entered():
	play(walk_animations[direction])


func _on_Idle_state_entered():
	animation = walk_animations[direction]
	playing = false
	frame = 0


func _on_SpellCasting_state_entered():
	play(fireball_animations[direction])


func _on_Attacking_state_entered():
	play(fireball_animations[direction])


func _on_Rolling_state_entered():
	play(roll_animations[direction])


func _on_Dying_state_entered():
	play("die")
