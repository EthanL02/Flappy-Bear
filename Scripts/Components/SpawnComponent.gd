class_name SpawnComponent extends Node
@onready var spawn_timer: Timer = $SpawnTimer

const SPAWN_DELAY : int = 50

signal hit
signal scored

@export var spawn_item : PackedScene
@export var vertical_range : Vector2i

var spawn_position : Vector2i
var screen_size : Vector2i
var items : Array

func _ready() -> void:
	spawn_timer.timeout.connect(spawn)
	screen_size = get_window().size
	spawn_position.x = screen_size.x + SPAWN_DELAY

func start() -> void:
	spawn_timer.start()

func update() -> void:
	for item in items:
		item.update()

func spawn() -> void:
	var item = spawn_item.instantiate()
	item.hit.connect(hit.emit)
	item.scored.connect(scored.emit)
	spawn_position.y = randi_range(vertical_range.x, vertical_range.y)
	item.position = spawn_position
	item.start(screen_size)
	add_child(item)
	items.append(item)
