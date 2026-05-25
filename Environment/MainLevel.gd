extends Node

@onready var ground: Ground = %Ground
@onready var start_menu: StartMenu = $StartMenu
@onready var spawn_container: Node2D = %SpawnContainer
@onready var spawn_timer: Timer = %SpawnTimer

@export var pipe_scene : PackedScene

var score
var ground_height : int

func _ready():
	Global.spawnContainer = spawn_container
	spawn_timer.timeout.connect(spawnPipes)
	
func spawnPipes():
	Global.spawnPipes.rpc_id(1)
	
func new_game():
	score = 0
	$ScoreLabel.text = "SCORE: " + str(score)
	
func scored():
	score += 1
	$ScoreLabel.text = "SCORE: " + str(score)

func _on_game_over_restart():
	new_game()
