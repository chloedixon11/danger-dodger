extends Node3D
class_name  Level

@onready var goals_node: Node3D = $GoalsNode

var main: Main
var goals: Array

func _ready() -> void:
	goals = goals_node.get_children()

func check_level_over():
	for goal in goals:
		if not goal.occupied:
			print("Game not over")
			return
	print("Game Over")
	main.next_level()
	#pause_menu.game_over("You Win!")
