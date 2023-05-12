extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard):
	var cabinet = blackboard.get_value("cabinet")
	print("playing " + cabinet.to_string())
	return RUNNING

