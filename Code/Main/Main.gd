extends Node
class_name Main

const TRAFFIC_TIME = preload("res://Levels/TrafficTime.tscn")
const WATER_WORLD = preload("res://Levels/WaterWorld.tscn")

@onready var pause_menu: PauseMenu = $PauseMenu

var level: Level = null

func _ready() -> void:
	level = TRAFFIC_TIME.instantiate()
	level.main = self
	add_child(level)

func next_level():
	level.queue_free()
	level = WATER_WORLD.instantiate()
	level.main = self
	add_child(level)
