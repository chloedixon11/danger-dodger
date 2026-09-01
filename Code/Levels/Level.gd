extends Node3D
class_name  Level

@onready var goal_0: Goal = $Goals/Goal0
@onready var goal_1: Goal = $Goals/Goal1
@onready var goal_2: Goal = $Goals/Goal2
@onready var goal_3: Goal = $Goals/Goal3
@onready var goal_4: Goal = $Goals/Goal4

var main: Main
var goals: Array

func _ready() -> void:
	goals.append(goal_0)
	goals.append(goal_1)
	goals.append(goal_2)
	goals.append(goal_3)
	goals.append(goal_4)

func check_level_over():
	for goal in goals:
		if not goal.occupied:
			print("Game not over")
			return
	print("Game Over")
	main.next_level()
	#pause_menu.game_over("You Win!")
