extends Control

#var game_scene = preload("res://Scene/Game/Game.tscn")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and event.is_echo() == false:
		GameManager.load_game_scene()


#func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	#get_tree().root.add_child(game_scene)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	pass # Replace with function body.
