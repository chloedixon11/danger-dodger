extends Area3D
class_name Duck

@onready var graphics: Node3D = $Graphics

var leap_distance: float = 1.0
var weight: float = 1.0
var weight_speed: float = 5.0

var current_spot: Vector3 = Vector3.ZERO
var next_spot: Vector3 = Vector3.ZERO

func _ready() -> void:
	area_entered.connect(on_entered)
	current_spot = position
	next_spot = position

func on_entered(other_area: Area3D) -> void:
	if other_area is Vehicle:
		print("lose a life")
	
	if other_area is Goal:
		print("Goal!!!")
		position = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if weight >= 1.0:
		if Input.is_action_just_pressed("move_left"):
			#position.x -= leap_distance
			next_spot = current_spot + Vector3.LEFT
			weight = 0
			graphics.rotation_degrees.y = 90
			
		if Input.is_action_just_pressed("move_right"):
			#position.x += leap_distance
			next_spot = current_spot + Vector3.RIGHT
			weight = 0
			graphics.rotation_degrees.y = -90
			
		if Input.is_action_just_pressed("move_up"):
			#position.z -= leap_distance
			next_spot = current_spot + Vector3.FORWARD
			weight = 0
			graphics.rotation_degrees.y = 0
		
		if Input.is_action_just_pressed("move_down"):
			#position.z += leap_distance
			next_spot = current_spot + Vector3.BACK
			weight = 0
			graphics.rotation_degrees.y = 180
			
	if weight < 1.0:
		weight += weight_speed * delta
		#if weight > 1.0:
			#weight = 1.0
			#current_spot = next_spot
	else:
		weight = 1.0
		current_spot = next_spot
			
	
	position = lerp(current_spot, next_spot, weight)
