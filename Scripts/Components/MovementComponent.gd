class_name MovementComponent extends Node

const GRAVITY : int = 980
const MAX_VELOCITY : int = 600

@export var body : CharacterBody2D

func update(delta: float) -> void:
	body.velocity.y += min(GRAVITY * delta, MAX_VELOCITY)
	
	body.move_and_slide()
