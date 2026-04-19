extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



@export var velocidade = 500.0
@export var trave_esquerda = 310.0
@export var trave_direita = 1590.0
@export var travessao = 260.0
@export var chao = 640.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direcao = Vector2.ZERO
	#Movimento Lateral:
	if Input.is_action_pressed("direita"):
		direcao.x += 1
	elif Input.is_action_pressed("esquerda"):
		direcao.x -= 1
	else:
		direcao.x = 0
	
	#Movimento Vertical:
	if Input.is_action_pressed("cima"):
		direcao.y -= 1
	elif Input.is_action_pressed("baixo"):
		direcao.y += 1
	else:
		direcao.y = 0

	#Normalizando e multiplicando pela velocidade:
	if direcao.length() > 0:
		direcao = direcao.normalized()*velocidade
	
	#Aplicando o movimento:
	position += direcao*delta
	
	#Limitando dentro do gol:
	position.x = clamp(position.x, trave_esquerda, trave_direita)
	position.y = clamp(position.y, travessao, chao)
	
	#Chute:
	if Input.is_action_just_pressed("acao"):
		emit_signal("chute", position)
	
	
