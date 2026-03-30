extends Node

@onready var player: Player = %Player
@onready var ground: Ground = %Ground
@onready var main_menu: MainMenu = $MainMenu
@onready var spawn_component: SpawnComponent = $SpawnComponent

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var score
var ground_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.start_solo.connect(start_solo)
	new_game()
	
func start_solo() -> void:	
	game_running = true
	spawn_component.start()
	ground.start()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	$ScoreLabel.text = "SCORE: " + str(score)
	$Player.reset()
	$GameOver.hide()
	
func _physics_process(delta: float) -> void:
	if game_running:
		player.update(delta)
		ground.update()
		spawn_component.update()
	
func scored():
	score += 1
	$ScoreLabel.text = "SCORE: " + str(score)
		
func stop_game():
	$Player.active = false
	game_running = false
	game_over = true
	$GameOver.show()
	
func player_hit():
	stop_game()


func _on_top_border_body_entered(body: Node2D):
	player_hit()


func _on_ground_hit():
	stop_game()


func _on_game_over_restart():
	new_game()
