extends Area2D
class_name PowerUp


func _on_body_entered(body):
	if body is Player:
		body.powerUp()
		queue_free()
