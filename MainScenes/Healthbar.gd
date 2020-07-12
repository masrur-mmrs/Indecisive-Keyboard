extends TextureProgress

func _on_health_updated(health):
	value = health

func _on_Player__health_updated(health):
	_on_health_updated(health)
