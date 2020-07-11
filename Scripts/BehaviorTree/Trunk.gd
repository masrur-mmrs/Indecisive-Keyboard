extends Task
class_name Trunk

export(NodePath) var acting_body_path
export var disabled = false
var acting_body: Node
var context := {}

func _ready():
	acting_body = get_node(acting_body_path)
	tree = self
	start()
	running()

func _process(delta):
	if !disabled:
		get_child(0).run()
