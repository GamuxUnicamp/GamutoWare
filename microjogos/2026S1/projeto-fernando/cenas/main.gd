extends Node2D
var aleatorio = randi()%3
var lista = ["Atacar", "Defender", "Conversar", "Item"]
var i = 0
var blade = 0
var levantar = 0
var sal_available = 0
var click = 0
var block = 0
var princess_fly = 0
var loss = 0
func delet():
	$Button.visible = false
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Sprite2D6.visible = false
	$Sprite2D7.visible = false
	$Sprite2D8.visible = false
	$Sprite2D2.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D3.visible = false
	$Button5.visible = false
	if aleatorio == 0:
		$AnimatedSprite2D.queue_free()
	else:
		$AnimatedSprite2D.play("default")
	if aleatorio == 1:
		$AnimatedSprite2D2.queue_free()
	else:
		$AnimatedSprite2D2.play("default")
	if aleatorio == 2:
		$AnimatedSprite2D.queue_free()
		$AnimatedSprite2D2.queue_free()






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Input.is_action_just_pressed("esquerda"):
		if i != 0:
			if block == 0:
				i-=1
	if Input.is_action_just_pressed("direita"):
		if i!=3:
			i+=1
	if Input.is_action_just_pressed("acao")  and loss != 1:
		if i == 1:
			if aleatorio == 0:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Sai de trás desse escudo!")
					princess_fly = 1
			if aleatorio == 1 and loss !=1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Sério?? E EU??? >:(")
					princess_fly = 1
			if aleatorio == 2 and loss !=1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("...Tá com medo de mim? Eu não mordo")
		if i == 2:
			if aleatorio == 0 and loss !=1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Isso não é undertale!")
					princess_fly = 1
			if aleatorio == 1 and loss !=1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Você tem uma espada cara! >:(")
					princess_fly = 1
			if aleatorio == 2 and loss != 1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Veio me salvar? Meu herói!")
					Minigames.register_win(self)
				
		
		if i == 0:
			if aleatorio == 1 and loss !=1:
				blade = 1
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Que corajoso! Meu herói! <3")
					Minigames.register_win(self)
					
					#meu herói!
					
			if aleatorio == 0 and loss !=1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Cortar um fantasma? É sério?")
				princess_fly = 1
				#if $RichTextLabel.visible_characters == len($RichTextLabel.TEXT):
					#pass
					#const SPEED = 600
					#$AnimatedSprite2D3.position.x -=SPEED*delta
					#$AnimatedSprite2D3.position.y -=SPEED*delta
					#rotation_degrees += 20000*delta
				#voce tentou cortar um fantasma? é sério? PERDEU UMA VIDA
				#talvez fazer ela walking, talvez ela tomando do bicho
			if aleatorio == 2 and loss !=1:
				if $AnimatedSprite2D3.animation != "parada":
					$AnimatedSprite2D3.play("parada")
					$RichTextLabel/Timer.start()
					mostrar_texto("Cortou meu cabelo, seu monstro!")
				
			#dps colocar um else aqui
	if Input.is_action_just_pressed("acao"):
		click +=1
		if i == 3:
			delet()
			$Sprite2D3.visible = true
			$Button5.visible = true
			$Button5.modulate = Color(1,0,0)
			block = 1
			if click == 2:
				if aleatorio == 1 and loss !=1:
					if $AnimatedSprite2D3.animation != "parada":
						$AnimatedSprite2D3.play("parada")
						$RichTextLabel/Timer.start()
						mostrar_texto("Sal!? Você quer comer a abóbora?")
						princess_fly = 1
					
				if aleatorio == 0 and loss != 1:
					if $AnimatedSprite2D3.animation != "parada":
						$AnimatedSprite2D3.play("parada")
						$RichTextLabel/Timer.start()
						mostrar_texto("Que esperto! Meu herói! <3")
						$AnimatedSprite2D2.fantasma_giro = 1
						Minigames.register_win(self)
					
				if aleatorio == 2 and loss !=1:
					if $AnimatedSprite2D3.animation != "parada":
						$AnimatedSprite2D3.play("parada")
						$RichTextLabel/Timer.start()
						mostrar_texto("Sal?! Eu sou hipertensa seu monstro")
						
					
						
				
			
			#faz aparecer sal e faz ser clicavel
			
#o que falta: 1)programar condicao de vitoria pras outras escolhas dependendo do bicho
#2: falas personalizadas pra cada opção
#3 sons
#4 combar timer do gamuto com os bichos chegando nela e fazendo ela voar
func mostrar_texto(text):
	$RichTextLabel.text = text
	$RichTextLabel.visible_characters = 0
	$RichTextLabel/Timer.start()

	
func _on_timer_timeout() -> void:
	$RichTextLabel.visible_characters +=1


func _on_area_2d_area_entered(area: Area2D):
	$AnimatedSprite2D3.voasim = 1
	loss = 1
	
	
