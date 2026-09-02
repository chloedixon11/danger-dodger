extends Node
class_name Main

const TRAFFIC_TIME = preload("res://Levels/TrafficTime.tscn")
const WATER_WORLD = preload("res://Levels/WaterWorld.tscn")
const SKY_WORLD = preload("res://Levels/SkyWorld.tscn")

@onready var pause_menu: PauseMenu = $PauseMenu

var levels: Array[PackedScene] = [SKY_WORLD, TRAFFIC_TIME, WATER_WORLD]
var current_level = -1
var level: Level = null

func _ready() -> void:
	restart()
	next_level()

func restart():
	current_level = -1
	next_level()
	

func next_level():
	if level:
		level.queue_free()
	current_level += 1
	if current_level > levels.size() - 1:
		current_level = 0
	level = levels[current_level].instantiate()
	level.main = self
	add_child(level)
