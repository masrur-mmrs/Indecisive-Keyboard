extends TextureProgress

var val


func _on_SpellCasting_cooldown_timer(duration):
	val = (duration/1.5 *100)
	value = val
