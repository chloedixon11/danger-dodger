extends Node3D
class_name  Level

@onready var goals_node: Node3D = $GoalsNode

var main: Main
var goals: Array

func _ready() -> void:
	goals = goals_node.get_children()

func goals_remaining() -> int:
	var occupied_count = 0
	for goal: Goal in goals:
		if goal.occupied:
			occupied_count += 1
	return goals.size() - occupied_count

func check_level_over() -> int:
	for goal in goals:
		if not goal.occupied:
			print("Game not over")
			return goals_remaining()
	print("Game Over")
	main.next_level()
	return 0
	#pause_menu.game_over("You Win!")
