extends CharacterBody2D

const START_POS = Vector2(100, 400)
const GRAVITY : int = 1000
const MAX_VEL : int = 600
const FLAP_SPEED : int = -500
var active : bool = false
var falling : bool = false

func _ready():
	reset()
	
func reset():
	falling = false
	active = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta: float):
	move(delta)
		
func move(delta: float):
	if active or falling:
		velocity.y += min(GRAVITY * delta, MAX_VEL)
			
		if active: 	# Normal state
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling: 	# In
			set_rotation(PI / 2)
			$AnimatedSprite2D.stop()
		
		move_and_collide(velocity * delta)
	else:
		$AnimatedSprite2D.stop()
		
func flap():
	velocity.y = FLAP_SPEED
