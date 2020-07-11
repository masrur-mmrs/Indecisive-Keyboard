extends GameState

var PHASE = PhaseManager.Phase.COMBAT

export var duration := 0.25
#export var cooldown_duration := 0.0
export(PackedScene) var spell
#onready var timer = get_node("CooldownTimerS")
#var val

signal spell_emitted(spell)
#signal cooldown_timer(duration)

func enter():
	if Globals.phase_manager.phase != PHASE:
		fsm.back()
		return
		
	if !fsm.acting_body.fireball_unlocked:
		fsm.back()
		return
	
#	if !$CooldownTimerS.is_stopped():
#		fsm.back()
#		return
	emit_signal("spell_emitted", spell)
	$SpellTimer.start(duration)
	
	
func _on_Timer_timeout():
#	$CooldownTimerS.start(cooldown_duration)
	fsm.back()


func _process(_delta):
#	emit_signal("cooldown_timer", timer.time_left)
	pass
