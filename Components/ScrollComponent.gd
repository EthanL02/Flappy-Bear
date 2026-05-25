class_name ScrollComponent extends Node

const SCROLL_SPEED : int = 4

@export var wrap := true
@export var body : Area2D

var scroll : int
var screen_size : Vector2i
	
func start(size) -> void:
	screen_size = size
	scroll = body.position.x
	
func set_position(newPos: Vector2):
	body.position = newPos
	scroll = body.position.x

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		scroll -= SCROLL_SPEED
		if wrap and scroll <= -screen_size.x:
			scroll = 0
		
		body.position.x = +scroll
