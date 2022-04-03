extends Position2D
signal mouseEntered
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_mouse_entered():
	emit_signal("mouseEntered")
