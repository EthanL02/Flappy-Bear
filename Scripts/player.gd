class_name Player extends CharacterBody2D
@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent

const START_POS = Vector2(100, 400)

func _enter_tree() -> void:
	set_multiplayer_authority(int(name))

func _ready():
	add_to_group('Players')
	if is_multiplayer_authority():
		pass
	
	reset()
	input_component.flap.connect(movement_component.flap)
	
func update(delta: float):
		input_component.update()
		movement_component.update(delta)
	
func reset():
	position = START_POS
