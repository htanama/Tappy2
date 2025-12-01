extends Node


signal on_plane_died
signal on_game_score

func custom_emit_on_plane_died() -> void:
	on_plane_died.emit()

func custom_emit_on_game_score() -> void:
	on_game_score.emit()
