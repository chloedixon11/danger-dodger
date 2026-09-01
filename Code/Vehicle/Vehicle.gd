extends Node3D
class_name Vehicle

var speed: float = 3.0
var kill_distance: float = 25

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta
	if position.x > kill_distance:
		position.x = -kill_distance
