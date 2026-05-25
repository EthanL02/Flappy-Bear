class_name InputComponent extends Node

signal flap

func _enter_tree() -> void:
	set_multiplayer_authority(int(name))

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		pass
	if Input.is_action_just_pressed("flap"):
		flap.emit()
