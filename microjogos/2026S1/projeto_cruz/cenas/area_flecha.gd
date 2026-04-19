extends Area2D

@export var velocidade: float = 500.0

func _ready():
	area_entered.connect(_on_area_entered)
	
	var notifier = VisibleOnScreenNotifier2D.new()
	notifier.screen_exited.connect(queue_free)
	add_child(notifier)

func _physics_process(delta):
	position.x += velocidade * delta

func _on_area_entered(area: Area2D):
	if area.is_in_group("Player"):
		var player = area.get_parent()
		if is_instance_valid(player):
			player.queue_free()
		
		queue_free()
