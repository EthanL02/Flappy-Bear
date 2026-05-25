class_name TreeObstacle extends Area2D

signal hit
signal scored

var scroll_component: ScrollComponent

func start(size) -> void:
	scroll_component = $ScrollComponent
	scroll_component.start(size)

func update() -> void:
	scroll_component.update()

func _on_body_entered(body: Node2D):
	hit.emit()


func _on_score_area_body_entered(body: Node2D):
	scored.emit()
