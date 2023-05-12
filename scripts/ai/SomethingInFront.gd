extends ConditionLeaf


func tick(actor: Node, blackboard: Blackboard):
	var npc:NPC = blackboard.get_value("NPC")
	if(npc.get_node("InteractionArea").has_overlapping_bodies()):
		return SUCCESS
	return FAILURE

