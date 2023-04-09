class_name Math extends Object


static func look_at(from:Vector3, to:Vector3):
	var direction = ((to-from)*Vector3(1,0,1)).normalized()
	return Vector2(direction.z,direction.x).angle() * Vector3.UP
