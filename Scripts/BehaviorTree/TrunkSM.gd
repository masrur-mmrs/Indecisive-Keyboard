extends GameState
class_name TrunkSM

# States
enum {
	FRESH,
	RUNNING,
	FAILED,
	SUCCEEDED,
	CANCELLED
}

var acting_body: Node
var context := {}
var tree = self


func enter():
	acting_body = fsm.acting_body
	start()

func process(_delta):
	get_child(0).run()


func child_success():
	pass

func child_fail():
	pass

func child_running():
	pass
	
func start():
	for child in get_children():
		child.control = self
		child.tree = self.tree
		child.start()
