class_name ScrollComponent extends Node

const SCROLL_SPEED : int = 4

@export var body : Area2D

var scroll : int = 0
var screen_size : Vector2i

func _ready() -> void:
	screen_size = get_window().size

func update() -> void:
	scroll += SCROLL_SPEED
	if scroll >= screen_size.x:
		scroll = 0
	
	body.position.x = -scroll
