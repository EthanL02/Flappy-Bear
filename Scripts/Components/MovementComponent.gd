class_name MovementComponent extends Node

const GRAVITY : int = 980
const MAX_VELOCITY : int = 600
const FLAP_STRENGTH : int = 500

@export var body : CharacterBody2D
@export var active = 0

func _enter_tree() -> void:
	set_multiplayer_authority(int(name))

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		pass
	body.velocity.y += min(GRAVITY * delta * active, MAX_VELOCITY)
	
	body.move_and_slide()
	
func flap():
	active = 1
	body.velocity.y = -FLAP_STRENGTH
