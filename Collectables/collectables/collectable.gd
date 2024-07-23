extends Area2D
class_name Collectable

const points: int = 2

func _on_body_entered(body):
	if body is Player:
		body.addPoints(points)
		queue_free()
