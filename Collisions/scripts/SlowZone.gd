extends Area2D

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.slowDown()


func _on_body_exited(body):
	if body is CharacterBody2D:
		body.speedUp()
