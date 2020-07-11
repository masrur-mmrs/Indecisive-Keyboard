extends Leaf

export var navpath_key = "navigation_path"
export var acceptable_range = 10

func run():
	var path: PoolVector2Array = tree.context[navpath_key]
	var length := 0.0
	
	for i in range(path.size() - 1):
		length += abs((path[i+1] - path[i]).length())
	
	if length <= acceptable_range:
		success()
	else:
		fail()
