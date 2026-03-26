class_name InputComponent extends Node

var flap_pressed := false

func update() -> void:
	flap_pressed = Input.is_action_just_pressed("flap")
