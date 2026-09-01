extends Area3D
class_name Goal

@onready var duck_graphics: Node3D = $DuckGraphics

var occupied: bool = false

func _ready() -> void:
	duck_graphics.hide()

func set_occupied():
	occupied = true
	duck_graphics.show()
