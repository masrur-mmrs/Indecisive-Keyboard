extends Task

class_name AlwaysFail

func run():
	if get_child_count() > 0:
		get_child(0).run()
	running()

# Ignore child success
func child_success():
	fail()

# Ignore child failure
func child_fail():
	fail()
