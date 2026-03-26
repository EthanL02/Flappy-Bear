class_name Ground extends Area2D

@onready var scroll_component: ScrollComponent = $ScrollComponent

signal hit

func update():
	scroll_component.update()

func _on_body_entered(body: Node2D):
	hit.emit()
