extends Control

@onready var game_over_label: Label = $GameOverLabel
@onready var press_space_label: Label = $PressSpaceLabel
@onready var score_lable: Label = $MarginContainer/ScoreLable
@onready var timer: Timer = $Timer

var score: int = 0
var is_replay: bool = false

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(display_game_over)
	SignalHub.on_game_score.connect(add_score_lable)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		GameManager.load_main_scene()
	elif is_replay and event.is_action_pressed("jump"):
		GameManager.load_game_scene()
	
	# another way to replay the game
	#if is_replay:
		#if event.is_action_pressed("jump") and get_tree().paused == true:
			#GameManager.load_game_scene()

func display_game_over() -> void:
	game_over_label.show()
	
	# First method to switch game over and press space
	#await get_tree().create_timer(2.0).timeout
	#display_press_space_lable()
	
	# Second method to switch game over and press space
	timer.start()

func display_press_space_lable() -> void:
	game_over_label.hide()
	press_space_label.show()
	is_replay = true
	

func add_score_lable() -> void:
	score += 1
	score_lable.text = var_to_str(score)


func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()
	is_replay = true
	
