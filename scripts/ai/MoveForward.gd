extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard):
	var npc:NPC = blackboard.get_value("NPC")
	
	npc.moveTowardsTarget = false
	npc.velocity = Vector3.BACK.rotated(Vector3.UP,npc.global_rotation.y)
	return SUCCESS

