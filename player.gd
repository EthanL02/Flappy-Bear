extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("Flap"):
		velocity.y -= 1
