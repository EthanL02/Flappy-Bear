extends CanvasLayer

@onready var button_join: Button = %ButtonJoin
@onready var button_quit: Button = %ButtonQuit

const PLAYER = preload("uid://cf4pln1iuokm3")
const MAINLEVEL = preload("uid://b7b7j6g6nenev")

var readyMenu : CanvasLayer

func _ready() -> void:
	button_join.pressed.connect(on_join)
	button_quit.pressed.connect(func(): get_tree().quit())
	
	if OS.has_feature('server'):
		Network.start_server()
		Network.add_world(false)
		hide()
	
func on_join():
	Network.join_server()
	Network.add_world(true)
	hide()
	
func add_world():
	var new_world = MAINLEVEL.instantiate()
	get_tree().current_scene.add_sibling.call_deferred(new_world)
