extends Area3D
class_name Duck

@onready var collider: CollisionShape3D = $Collider
@onready var graphics: Node3D = $Graphics
@onready var lives_ui: Label = $UI/VBox/LivesUI

@export var lives: int = 3
@export var level: Level

var leap_distance: float = 1.0
var weight: float = 1.0
var weight_speed: float = 5.0

var spawning_point: Vector3
var current_spot: Vector3 
var next_spot: Vector3 

func _ready() -> void:
	area_entered.connect(on_entered)
	
	spawning_point = position
	current_spot = position
	next_spot = position
	
	level = get_parent()
	update_lives(0)


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
	if current_spot == spawning_point:
		graphics.show()
		collider.disabled = false

func update_lives(delta_lives: int):
	lives += delta_lives
	lives_ui.text = "Lives: " + str(lives)
	pass

func respawn():
	graphics.hide()
	collider.set_deferred("disabled", true)
	
	next_spot = spawning_point
	weight = 0.0
	

func on_entered(other_area: Area3D) -> void:
	if other_area is Goal:
		respawn()
		print("Goal!!!")
		other_area.set_occupied()
		level.check_level_over()

	if other_area is Vehicle:
		update_lives(-1)
		respawn()
		print(lives)
