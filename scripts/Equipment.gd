class_name Equipment extends PlayerInteractable
var sg : Singleton = Singleton.current

func equip_to(player : Player):
	#var remoteTrans : RemoteTransform3D = player.get_node("Body/EquipmentTrans")
	#remoteTrans.global_transform = global_transform
	player.equip(self)
	get_node("Body/CollisionShape3D").disabled = true
	get_node("Body").freeze = true
	#remoteTrans.remote_path = self.get_path()
	
func unequip_to(player : Player):
	#var remoteTrans : RemoteTransform3D = player.get_node("Body/EquipmentTrans")
	#remoteTrans.global_transform = global_transform
	player.unequip(self)	
	get_node("Body/CollisionShape3D").disabled = false
	get_node("Body").freeze = false
	#remoteTrans.remote_path = ""
