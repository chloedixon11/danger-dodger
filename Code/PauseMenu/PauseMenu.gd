extends PanelContainer
class_name PauseMenu

@onready var title: Label = $VBox/Title
@onready var play_button: Button = $VBox/PlayButton
@onready var quit_button: Button = $VBox/QuitButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play_button_pressed)
	quit_button.pressed.connect(on_quit_button_pressed)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()

	
func toggle_pause():
	if get_tree().paused:
		hide()
		get_tree().paused = false
	else:
		show()
		get_tree().paused = true

	
func on_play_button_pressed():
	get_tree().paused = false
	hide()

func on_quit_button_pressed():
	get_tree().quit()
