extends CanvasLayer

signal solo_start

func _on_play_button_pressed() -> void:
	solo_start.emit()
	hide()
