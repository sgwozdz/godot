extends CharacterBody2D
class_name Player

const MAX_JUMPS = 2
const POWER_UP_MULTIPLIER = 1.5
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jumpsLeft = MAX_JUMPS
var score = 0
var speed = 300.0

@onready var sprite = $AnimatedSprite2D
@onready var score_label = %ScoreLabel
@onready var timer = $Timer

func _physics_process(delta):

	handle_movement(delta)
	move_and_slide()

func handle_movement(delta:float):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jumpsLeft = MAX_JUMPS
		
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or (jumpsLeft > 0 and jumpsLeft < MAX_JUMPS)):
		velocity.y = JUMP_VELOCITY
		jumpsLeft -= 1
		
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	handle_animations(direction)

func handle_animations(direction:float):
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		sprite.play("jump")

func addPoints(points:int):
	score += points
	score_label.score = score

func powerUp():
	timer.start()
	speed *= POWER_UP_MULTIPLIER

func _on_timer_timeout():
	speed /= POWER_UP_MULTIPLIER
