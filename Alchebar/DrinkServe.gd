extends Node2D
var fullTex = preload("res://art/Full-Orange.png")
var halfTex = preload("res://art/Half-Orange.png")
var emptyTex = preload("res://art/glass2Empty.png")
var curVar = 0
signal serveDrink
signal emptyDrink
var selected = false
var targetNode
onready var bottleSprite = get_node("Bottle")
var restPoint
var served = false

func _ready():
	restPoint = global_position
	targetNode = get_tree().get_nodes_in_group("slideTarget")

func select():
	if(curVar <2):
		curVar += 1
	switchTexture()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false

func switchTexture():
	if(curVar==0):
		bottleSprite.set_texture(emptyTex)
	elif(curVar==1):
		bottleSprite.set_texture(halfTex)
	elif(curVar==2):
		bottleSprite.set_texture(fullTex)

func _physics_process(delta):
	if served:
		global_position = lerp(global_position, Vector2(1500, 272), 5*delta)
		if(global_position[0] > 1400):
			served = false
			global_position[0]=-100
		
	else:
		if selected:
			global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
			look_at(get_global_mouse_position())
		else:
			global_position = lerp(global_position, restPoint, 10*delta)
			rotation = lerp_angle(rotation, 0, 10*delta)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(Input.is_action_just_pressed("click")):
		selected = true



func _on_SlideLocation_mouseEntered():
	if selected:
		selected = false
		served = true
		curVar = 0
		emit_signal("serveDrink")
		switchTexture()


func _on_TrashLocation_mouseEntered():
	if selected:
		selected = false
		emit_signal("emptyDrink")
		curVar = 0
		global_position[0]=-100
		switchTexture()
