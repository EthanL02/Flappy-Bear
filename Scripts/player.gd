class_name Player extends CharacterBody2D
@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent

const START_POS = Vector2(100, 400)

var ground: Ground

func _enter_tree() -> void:
	set_multiplayer_authority(int(name))

func _ready():
	if not is_multiplayer_authority():
		return
	ground = $"/root/MainLevel/Ground"
	ground.hit.connect(reset)
	add_to_group('Players')
	
	reset()
	input_component.flap.connect(movement_component.flap)
	
func reset():
	if not is_multiplayer_authority():
		return
	movement_component.body.velocity.y = 0
	movement_component.active = 0
	position = START_POS
