extends TextureProgress

enum Phase {
	MOVEMENT,
	COMBAT
}



func _on_PhaseManager_updated_timer(duration) :
	var percentage = int((duration/5.0)*100)
	if percentage%10 == 0:
		value = percentage


