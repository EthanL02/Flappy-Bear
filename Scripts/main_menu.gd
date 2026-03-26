extends CanvasLayer
@onready var player: Player = %Player

func _on_play_button_pressed() -> void:
	player.active = true
	hide()
