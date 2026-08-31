extends Node3D
class_name Duck


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		position.x -= 1
		
	if Input.is_action_just_pressed("move_right"):
		position.x += 1
		
	if Input.is_action_just_pressed("move_up"):
		position.z -= 1
	
	if Input.is_action_just_pressed("move_down"):
		position.z += 1
		
	pass
