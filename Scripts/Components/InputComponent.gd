class_name InputComponent extends Node

signal flap

func update() -> void:
	if Input.is_action_just_pressed("flap"):
		flap.emit()
