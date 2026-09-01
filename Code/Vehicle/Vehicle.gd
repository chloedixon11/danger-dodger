extends Area3D
class_name Vehicle

var speed: float = 3.0
var kill_distance: float = 10.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += speed * delta
	if position.z > kill_distance:
		position.z = -kill_distance
