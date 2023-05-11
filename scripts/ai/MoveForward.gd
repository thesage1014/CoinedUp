extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard):
	var npc:NPC = blackboard.get_value("NPC")
	if(npc.get_node("InteractionArea").has_overlapping_bodies()):
		return FAILURE
	else:
		print("Moving Forward")
		npc.moveTowardsTarget = false
		npc.velocity = Vector3.BACK.rotated(Vector3.UP,npc.global_rotation.y)
		return SUCCESS

