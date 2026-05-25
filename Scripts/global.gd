extends Node

const PIPES = preload("uid://c6s7ucq6ua634")
const VERTICAL_RANGE := Vector2i (200, 700)
const SPAWN_DELAY : int = 500

var spawnContainer : Node2D
var spawn_position : Vector2i

@rpc("any_peer")
func spawnPipes():
	var newPipes = PIPES.instantiate()
	var scrollComponent = newPipes.get_node("ScrollComponent")
	spawn_position.y = randi_range(VERTICAL_RANGE.x, VERTICAL_RANGE.y)
	spawn_position.x = SPAWN_DELAY
	
	scrollComponent.set_position(spawn_position)
	
	#var item = spawn_item.instantiate()
	#item.hit.connect(hit.emit)
	#item.scored.connect(scored.emit)
	#spawn_position.y = randi_range(VERTICAL_RANGE.x, VERTICAL_RANGE.y)
	#item.position = spawn_position
	#item.start(screen_size)
	#add_child(item)
	#items.append(item)
	
	#screen_size = get_window().size
	#spawn_position.x = screen_size.x + SPAWN_DELAY
	
	spawnContainer.add_child(newPipes, true)
