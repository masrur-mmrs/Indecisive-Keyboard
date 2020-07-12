extends GameState

export(float) var duration = 1.2
export var death_menu = "res://UI elements/Death Menu/DeathMenu.tscn"

func enter():
	Globals.navigation = null
	$Timer.start(duration)


func _on_Timer_timeout():
	var __ = get_tree().change_scene(death_menu)
	pass
