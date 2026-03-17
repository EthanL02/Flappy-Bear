extends Node

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$Player.reset()
					
func start_game():
	game_running = true
	$Player.flying = true
	$Player.flap()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Input.is_action_just_pressed("flap"):
		flap()
		
func flap():	
	if game_running == false:
		start_game()
	elif $Player.flying:
		$Player.flap()
