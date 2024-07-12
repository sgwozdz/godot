extends CharacterBody2D


const SPEED = 200.0


func _physics_process(delta):

	var direction = Input.get_vector("Left", "Right", "Up", "Down");
	velocity = direction * SPEED

	move_and_slide()
