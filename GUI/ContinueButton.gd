extends Button

onready var scene = get_node("SceneChanger")

func _on_ContinueButton_pressed():
	scene.change_scene("res://MainScenes//Main.tscn")#yo sadman change this to the last checkpoint alright?
