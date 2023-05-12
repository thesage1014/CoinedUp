extends ConditionLeaf


func tick(actor: Node, blackboard: Blackboard):
	var npc:NPC = blackboard.get_value("NPC")
#	var cabinets = npc.get_node("InteractionArea").get_overlapping_bodies()
#	if(cabinets.size() > 0):
#		print("found cabinet")
#		blackboard.set_value("cabinet",cabinets[0])
#		return SUCCESS
	return FAILURE

func isCabinet(v:Node):
	return v.get_parent().is_class("Cabinet")
