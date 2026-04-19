extends CharacterBody2D

const MAX_VELOCITY = 1000
const PROPULSION = 200
const ANGULAR_VELOCITY = PI/1.5

var lua
func _ready() -> void:
	lua = get_node("../Lua")

func _physics_process(delta: float) -> void:
	# Define aceleração = propulsão + gravidade
	var acceleration: Vector2 = gravityAcceleration()
	if Input.is_action_pressed("acao") and velocity.length() != MAX_VELOCITY:
		acceleration += Vector2.UP.rotated(rotation)*PROPULSION
	
	velocity += acceleration*delta

	# Rotação varia com setinhas
	var angleDirection = Input.get_axis("esquerda", "direita")
	rotation += angleDirection*ANGULAR_VELOCITY*delta

	if move_and_collide(velocity*delta) and velocity.length()<250:
		Minigames.register_win(self)
		print(velocity.length())

func gravityAcceleration():
	var directionVec: Vector2 = lua.position-position
	var normalizedVec: Vector2 = directionVec.normalized()
	
	var acceleration = (10**6.7)*normalizedVec/(directionVec.length_squared()-6767)
	
	return acceleration
