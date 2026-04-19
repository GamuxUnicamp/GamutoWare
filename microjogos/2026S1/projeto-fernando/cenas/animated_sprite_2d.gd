extends AnimatedSprite2D
const SPEED = 120
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	var voar = get_parent().blade
	if voar == 0:
		position.x-=SPEED*delta
	else:
		const SPEED = 300
		position.x +=SPEED*delta
		position.y -=SPEED*delta
		rotation_degrees += 20000*delta

	
