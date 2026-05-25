class_name Player extends CharacterBody2D
@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent

const START_POS = Vector2(100, 400)

var ground: Ground

func _enter_tree() -> void:
	set_multiplayer_authority(int(name))

func _ready():
	if is_multiplayer_authority():
		pass
	ground = $"/root/MainLevel/Ground"
	ground.hit.connect(reset)
	add_to_group('Players')
	
	reset()
	input_component.flap.connect(movement_component.flap)
	
func _physics_process(delta: float):
	if is_multiplayer_authority():
		pass
	
func reset():
	if is_multiplayer_authority():
		pass
	movement_component.body.velocity.y = 0
	movement_component.active = 0
	position = START_POS
