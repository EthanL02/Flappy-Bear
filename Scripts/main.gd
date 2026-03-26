extends Node

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200
var screen_size : Vector2i
var ground_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$ScoreLabel.text = "SCORE: " + str(score)
	$Player.reset()
	$GameOver.hide()
	get_tree().call_group("pipes", "queue_free")
	pipes.clear()	
	generate_pipes()
					
func start_game():
	game_running = true
	$Player.active = true
	$Player.flap()
	$PipeTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if game_running:
		scroll += SCROLL_SPEED
		
		if scroll >= screen_size.x:
			scroll = 0
		
		$Ground.position.x = -scroll
		
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED
	#
	#if Input.is_action_just_pressed("flap"):
		#flap()
		
func flap():
	if game_over == false:
		if game_running == false:
			start_game()
		else:
			if $Player.active:
				$Player.flap()


func _on_pipe_timer_timeout():
	generate_pipes()
	
func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	pipe.hit.connect(player_hit)
	pipe.scored.connect(scored)
	add_child(pipe)
	pipes.append(pipe)
	
func scored():
	score += 1
	$ScoreLabel.text = "SCORE: " + str(score)
		
func stop_game():
	$PipeTimer.stop()
	$Player.active = false
	game_running = false
	game_over = true
	$GameOver.show()
	
func player_hit():
	$Player.falling = true
	stop_game()


func _on_top_border_body_entered(body: Node2D):
	player_hit()


func _on_ground_hit():
	$Player.falling = false
	stop_game()


func _on_game_over_restart():
	new_game()
