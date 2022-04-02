extends Position2D

var occupied = false

func _draw():
	var rect = Rect2(-25, 10, 50, 10)
	draw_rect(rect, Color.saddlebrown)
	#draw_circle(Vector2.ZERO, 25, Color.teal)
	
func select():
	#for child in get_tree().get_nodes_in_group("zone"):
	#	child.deselect()
	modulate = Color.blue
	occupied = true
	
func deselect():
	modulate = Color.saddlebrown
	occupied = false

func isOccupied():
	return occupied
