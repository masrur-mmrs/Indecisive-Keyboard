extends GameState

export var speed = 300
export var exploding_scene = "Exploding"

func physics_process(delta):
	var velocity = Vector2.RIGHT * speed
	velocity = velocity.rotated(fsm.acting_body.rotation)
	fsm.acting_body.position += velocity * delta
