class_name MainMenu extends CanvasLayer

signal start_solo

func _on_play_button_pressed() -> void:
	start_solo.emit()
	hide()
