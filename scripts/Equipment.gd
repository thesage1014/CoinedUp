class_name Equipment extends PlayerInteractable
var sg : Singleton = Singleton.current

func equip_to(player : Player):
	var remoteTrans : RemoteTransform3D = player.get_node("Body/EquipmentTrans")
	remoteTrans.global_transform = global_transform
	remoteTrans.remote_path = self.get_path()
	
