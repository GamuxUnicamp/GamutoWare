extends RichTextLabel
@export var final_text = ""
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#text = final_text.substr(0, count)
	pass


func _on_timer_timeout() -> void:
	count+=1 # Replace with function body.
