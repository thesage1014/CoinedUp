class_name HandTruck extends Equipment
@onready var transformHelper = $Body/TransformHelper
func interact_from(player : Player):
	body.transform.origin = initialBodyPos
	body.rotation = initialBodyAng
	body.linear_velocity = Vector3.ZERO
	body.angular_velocity = Vector3.ZERO
	equip_to(player)

