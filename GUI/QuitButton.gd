extends Button


onready  var sound = $Click

func _on_QuitButton_pressed():
	sound.play()
	get_tree().quit()
