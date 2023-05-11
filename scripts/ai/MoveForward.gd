extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard):
	NPC npc = blackboard.get_value("NPC")
	print npc
	return SUCCESS

