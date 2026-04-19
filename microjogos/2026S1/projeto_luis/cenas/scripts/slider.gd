extends Area2D

var velocidade = 100
var start = Vector2(-210,-175)
var direcao = Vector2(1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = start


func _process(delta: float) -> void:
	var indice = -(abs(position.x))*2/220 + 6
	
	if position.x < 210 and direcao.x > 0:
		position += velocidade * delta * direcao *indice
	elif position.x > 210 and direcao.x > 0:
		direcao.x = -1
	
	if direcao.x < 0 and position.x > -210:
		position += velocidade * delta * direcao *indice
	elif direcao.x < 0 and position.x < -210:
		direcao.x = 1
		

		
	
	
	#if position.x <= 0 and direcao.x > 0:
	#	indice = (position.x/-(220))
	#	position += velocidade
	
	
	
		
