extends Button

onready var scene = get_node("SceneChanger")

func _on_Return_to_main_pressed():
	scene.change_scene("res://UI elements/Main Menu/MainMenu.tscn")
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
