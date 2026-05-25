extends Node

@onready var ground: Ground = %Ground
@onready var start_menu: StartMenu = $StartMenu
@onready var spawn_component: SpawnComponent = $SpawnComponent

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var score
var ground_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	ground.hit.connect(player_hit)
	#start_menu.start_solo.connect(start_solo)
	#new_game()
	#start_solo()
	pass
	
#func start_solo() -> void:	
	#game_running = true
	#spawn_component.start()
	#spawn_component.hit.connect(player_hit)
	#spawn_component.scored.connect(scored)
	#ground.start()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	$ScoreLabel.text = "SCORE: " + str(score)
	
func _physics_process(delta: float) -> void:
	if game_running:
		#player.update(delta)
		#ground.update()
		#spawn_component.update()
		pass
	
func scored():
	score += 1
	$ScoreLabel.text = "SCORE: " + str(score)
	
func player_hit():
	pass


func _on_game_over_restart():
	new_game()
