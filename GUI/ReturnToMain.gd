extends Button

onready var scene = get_node("SceneChanger")

func _on_Return_to_main_pressed():
	scene.change_scene("res://MainScenes//MainMenu.tscn")
