extends Node
class_name Main


const DUCK = preload("res://Duck/Duck.tscn")

const SKY_WORLD = preload("res://Level/SkyWorld/SkyWorld.tscn")
const TRAFFIC_TIME = preload("res://Level/TrafficTime/TrafficTime.tscn")
const WATER_WORLD = preload("res://Level/WaterWorld/WaterWorld.tscn")

@onready var pause_menu: PauseMenu = $PauseMenu

var duck: Duck
var levels: Array[PackedScene] = [SKY_WORLD, TRAFFIC_TIME, WATER_WORLD]
var current_level = -1
var level: Level = null








func restart():
	if duck:
		duck.queue_free()
	duck = DUCK.instantiate()
	
	add_child(duck)
	
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
	duck.level = level
	duck.spawning_point = level.spawning_point.position
	#duck.position = level.spawning_point.position
