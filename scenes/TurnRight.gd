extends ActionLeaf


func tick(actor: Node, blackboard: Blackboard):
	print("turning right")
	var npc:NPC = blackboard.get_value("NPC")
	npc.velocity *= .8
	npc.global_rotation += Vector3(0,-.05,0)
	return SUCCESS
