class_name SpawnComponent extends Node
@onready var spawn_timer: Timer = $SpawnTimer

const SPAWN_DELAY : int = 0

@export var spawn_item : PackedScene

var spawn_position : Vector2i
var screen_size : Vector2i
var items : Array

func _ready() -> void:
	spawn_timer.timeout.connect(spawn)
	screen_size = get_window().size
	spawn_position.x = screen_size.x + SPAWN_DELAY
	#spawn_position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)

func start() -> void:
	spawn_timer.start()

func update() -> void:
	for item in items:
		item.update()

func spawn() -> void:
	var item = spawn_item.instantiate()
	item.position = spawn_position
	item.start(screen_size)
	#pipe.position.x = screen_size.x + PIPE_DELAY
	#pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	#pipe.hit.connect(player_hit)
	#pipe.scored.connect(scored)
	add_child(item)
	items.append(item)
