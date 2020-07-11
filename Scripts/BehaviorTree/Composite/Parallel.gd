extends Task

# Run all child Tasks together in SEQUENCE or SELECTOR policy mode

class_name Parallel

enum Policy { SEQUENCE, SELECTOR }

export(Policy) var policy = Policy.SEQUENCE

var num_results = 0
var stop = false

func run():
	stop = false
	for child in get_children():
		child.run()
		if stop:
			break
	running()

func child_success():
	num_results += 1
	if policy == Policy.SEQUENCE:
		if num_results >= get_child_count():
			num_results = 0
			stop = true
			success()
	else:
		stop = true
		success()

func child_fail():
	num_results += 1
	if policy == Policy.SELECTOR:
		if num_results >= get_child_count():
			num_results = 0
			stop = true
			fail()
	else:
		stop = true
		fail()
