class_name Math extends Object


#static func look_at(from:Vector3, to:Vector3):
#	var direction = ((to-from)*Vector3(1,0,1)).normalized()
#	print("look at ",Vector2(direction.z,direction.x).angle())
#	return Vector2(direction.z,direction.x).angle() * Vector3.UP
#
#static func lerp_at(from:Vector3, to:Vector3, startingAngle:float, amount:float) -> float:
#	var direction = ((to-from)*Vector3(1,0,1)).normalized()
#	var newAng = Vector2(direction.z,direction.x).angle()
#	return lerp_angle(startingAngle, newAng, amount)

static func xz(vec3:Vector3) -> Vector2:
	return Vector2(vec3.x,vec3.z)
	
static func yx(vec3:Vector3) -> Vector2:
	return Vector2(vec3.y,vec3.x)

static func zx(vec3:Vector3) -> Vector2:
	return Vector2(vec3.z,vec3.x)
