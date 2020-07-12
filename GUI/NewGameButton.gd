extends Button

onready var scene = get_node("SceneChanger")
onready var sound = $Click


func _on_NewGame_pressed():
	sound.play()
	scene.change_scene("res://UI elements/TutorialScreen/Tutorial.tscn")
