extends Node2D

func _physics_process(_delta):
	rotation = (get_global_mouse_position() - global_position).angle()

func _emit(spell: PackedScene):
	var spell_instance: Node2D = spell.instance()
	spell_instance.global_transform = $Spawnpoint.global_transform
	get_tree().get_root().add_child(spell_instance)


func _on_SpellCasting_spell_emitted(spell):
	get_node("spell").play()
	_emit(spell)
