extends GameState

export var duration = 0.4

func enter():
	$Timer.start(duration)

func _on_Timer_timeout():
	fsm.acting_body.queue_free()
