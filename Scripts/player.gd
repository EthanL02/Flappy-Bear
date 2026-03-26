class_name Player extends CharacterBody2D
@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent

const START_POS = Vector2(100, 400)
const FLAP_SPEED : int = -500
@export var active : bool = false
var falling : bool = false

func _ready():
	reset()
	
func reset():
	falling = false
	active = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta: float):
	if active:
		input_component.update()
		movement_component.update(delta)
		
func flap():
	velocity.y = FLAP_SPEED
