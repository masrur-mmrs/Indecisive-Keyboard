extends Task

# Repeats the child Task and reports Success after repeating unless it fails

class_name Repeat

# Number of times to run or zero for infinite
export(int) var LIMIT = 0

var count = 0
var repeating = false

func run():
#	if not repeating:
#		repeating = true
#		get_child(0).run()
	get_child(0).run()
	running()

func child_success():
	if LIMIT > 0:
		count += 1
		if count >= LIMIT:
			count = 0
			repeating = false
			success()
	if repeating:
		get_child(0).run()

func child_fail():
	if LIMIT > 0:
		count += 1
		if count >= LIMIT:
			count = 0
			repeating = false
			success()
	if repeating:
		get_child(0).run()
