extends CharacterBody2D

const PROPULSION = 200
const ANGULAR_VELOCITY = PI/1.5

var lua
func _ready() -> void:
	lua = get_node("../Lua")
	
	# Áudio da nave
	$AudioPropulsao.play()
	$AudioPropulsao.stream_paused = true
	
	# Define distância ao centro da lua e variação em relação ao eixo x
	var initialPosition = randfn(600, 50)
	var initialPositionAngle = randf_range(-PI/4, PI/4)
	# Define lado em que nave spawna (side=0 -> direita, side=1 -> esquerda)
	var side = randi()%2
	var displacement = Vector2.RIGHT.rotated(initialPositionAngle+(PI*side))*initialPosition
	set_position(lua.position+displacement)
	
	# Define vetor velocidade inicial
	var initialVelocity = randfn(0.5, 0.3)*200
	var initialVelocityAngle = randfn(initialPositionAngle+PI, PI/5)
	velocity = Vector2.UP.rotated(initialVelocityAngle)*initialVelocity


var win: bool = false
func _physics_process(delta: float) -> void:
	# Define aceleração = propulsão + gravidade
	var acceleration: Vector2 = gravityAcceleration()
	if Input.is_action_pressed("acao"):
		acceleration += Vector2.UP.rotated(rotation)*PROPULSION
		
		# Animação e som
		$Sprite2D/AnimationPlayer.play("acelerado")
		$AudioPropulsao.stream_paused = false
	else:
		# Animação e som
		$Sprite2D/AnimationPlayer.play("parado")
		$AudioPropulsao.stream_paused = true
	
	velocity += acceleration*delta

	# Rotação varia com setinhas
	var angleDirection = Input.get_axis("esquerda", "direita")
	rotation += angleDirection*ANGULAR_VELOCITY*delta

	if move_and_collide(velocity*delta) and not win:
		if velocity.length()<225:
			Minigames.register_win(self)
			win = true
			
			win_explosion()
		else: lose_explosion()
		

func gravityAcceleration() -> Vector2:
	var directionVec: Vector2 = lua.position-position
	var normalizedVec: Vector2 = directionVec.normalized()
	
	var acceleration = (10**6.7)*normalizedVec/(directionVec.length_squared()-6767)
	
	return acceleration


func lose_explosion() -> void:
	$Sprite2D.visible = false
	
	$ExplosionParticles.rotation = -rotation
	$ExplosionParticles.direction = velocity.normalized()
	$ExplosionParticles.emitting = true
	
	$AudioExplosao.play()


func win_explosion() -> void:
	var luaNave: Vector2 = position-lua.position
	rotation = luaNave.angle()+PI/2
