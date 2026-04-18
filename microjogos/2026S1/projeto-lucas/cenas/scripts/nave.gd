extends CharacterBody2D

const MAX_VELOCITY = 1000
const ACCELERATION = 200
const ANGULAR_VELOCITY = PI/1.5

var lua
func _ready() -> void:
	lua = get_node("../Lua")

func _physics_process(delta: float) -> void:
	# Velocidade varia conforme aceleração
	if Input.is_action_pressed("acao") and velocity.length() != MAX_VELOCITY:
		velocity += Vector2.UP.rotated(rotation)*ACCELERATION*delta

	# Rotação varia com setinhas
	var angleDirection := Input.get_axis("esquerda", "direita")
	rotation += angleDirection*ANGULAR_VELOCITY*delta

	move_and_slide()
