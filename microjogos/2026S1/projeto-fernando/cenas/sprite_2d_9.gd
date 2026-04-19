extends Sprite2D
const SPEED = 2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass

func _physics_process(delta: float) -> void:
	var aparecer = get_parent().blade
	if aparecer == 1:
		visible = true
		position.x+=SPEED*delta
		position.y-=SPEED*delta
		
		
		
		
