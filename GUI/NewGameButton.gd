extends Button

onready var scene = get_node("SceneChanger")


func _on_NewGame_pressed():
	scene.change_scene("res://MainScenes/Main.tscn")
