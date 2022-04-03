extends Node2D

const customer_skins = [preload("res://art/Guy-Business_Suit_1.png"), preload("res://art/Guy-Business_Suit_1_Alt.png"),
						preload("res://art/Guy-Business_Suit_2.png"), preload("res://art/Guy-Business_Suit_2_Alt.png")]
var order_type = ["Drink", "Alchemy"]
var order_mix = [0, 0, 0, 0, 0, 0 ]
						
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func generate():
	$Sprite.texture = customer_skins[randi() % customer_skins.size()]
	
	# randomize order mix array
	
	var ingredients = []
	ingredients.append(randi() % order_mix.size())
	ingredients.append(randi() % order_mix.size())
	ingredients.append(randi() % order_mix.size())
	
	for i in ingredients:
		order_mix[i] = (randi() % 3) + 1
	
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("Click")
		

func order_up():
	if $BarScene.SubmitMix == true:
		generate()
