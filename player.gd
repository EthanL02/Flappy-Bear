extends CharacterBody2D

const GRAVITY = 200

@export var jump_strength = 400


func _physics_process(delta: float):
	velocity.y += delta * GRAVITY
	
	var motion = velocity * delta
	move_and_collide(motion)
