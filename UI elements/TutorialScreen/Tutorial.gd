extends Control

export var next_scene = "res://MainScenes/Main.tscn"

func _input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene(next_scene)
