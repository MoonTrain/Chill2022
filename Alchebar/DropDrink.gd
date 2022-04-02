extends Position2D
var fullTex = preload("res://art/Full-Orange.png")
var halfTex = preload("res://art/Half-Orange.png")
var emptyTex = preload("res://art/Empty.png")
var curVar = 0


onready var bottleSprite = get_node("Bottle")

func _ready():
	print(global_position)

func select():
	if(curVar <2):
		curVar += 1
	switchTexture()

func switchTexture():
	if(curVar==0):
		bottleSprite.set_texture(emptyTex)
	elif(curVar==1):
		bottleSprite.set_texture(halfTex)
	elif(curVar==2):
		bottleSprite.set_texture(fullTex)
	
