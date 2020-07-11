extends Leaf
class_name EmitSignal

signal signal_emitted

func run():
	emit_signal("signal_emitted")
	success()
