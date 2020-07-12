extends AnimatedSprite

var ANIMATIONS = {
	PhaseManager.Phase.MOVEMENT: "movement",
	PhaseManager.Phase.COMBAT: "combat"
}

func _on_PhaseManager_phase_changed(phase):
	animation = ANIMATIONS[phase]
