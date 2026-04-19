extends CharacterBody2D

const GRAVITY = 1200.0
const JUMP_VELOCITY = 600.0

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("acao") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D):
	queue_free()
