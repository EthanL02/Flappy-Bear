class_name Player extends CharacterBody2D
@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent

const START_POS = Vector2(100, 400)
@export var active : bool = false

func _ready():
	reset()
	input_component.flap.connect(movement_component.flap)
	
func reset():
	active = false
	position = START_POS
	
func _physics_process(delta: float):
	if active:
		input_component.update()
		movement_component.update(delta)
