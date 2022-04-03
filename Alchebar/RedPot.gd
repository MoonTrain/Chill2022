extends Node2D

signal addDrink

var selected = false
var rest_point
var rest_nodes = []
var glassNode = []
var fullTex
var halfTex
var emptyTex
var curVar = 0
var curNode
var properties = []
var color

const POUR_SOUNDS = [
	preload("res://audio/pour1.wav"),
	preload("res://audio/fizzy pour 1.wav")
]

const PICKUP_SOUNDS = [
	preload("res://audio/pickup1.wav"),
	preload("res://audio/pickup2.wav"),
	preload("res://audio/pickup3.wav")
]

const PUTDOWN_SOUNDS = [
	preload("res://audio/putdown-01.wav"),
	preload("res://audio/putdown-02.wav"),
	preload("res://audio/putdown-03.wav")
]

onready var bottleSprite = get_node("Full-Red")

func play_sound(list):
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.stream = list[randi() % list.size()]
		$AudioStreamPlayer2D.play()

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	#rest_nodes.append_array(get_tree().get_nodes_in_group("DrinkZone"))
	var i = 0
	while(rest_nodes[i].isOccupied()):
		i+=1
	rest_point = rest_nodes[i].global_position
	rest_nodes[i].select()
	curNode = i
	glassNode = get_tree().get_nodes_in_group("DrinkZone")
	

func init(var p, var ft, var ht, var et):
	properties = p
	fullTex = ft
	halfTex = ht
	emptyTex = et
	switchTexture()
	
func loadTextures():
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(Input.is_action_just_pressed("click")):
		selected = true
		
		play_sound(PICKUP_SOUNDS)

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
		look_at(get_global_mouse_position())
	else:
		global_position = lerp(global_position, rest_point, 10*delta)
		rotation = lerp_angle(rotation, 0, 10*delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 35
			var tmp = 0;
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					rest_nodes[curNode].deselect()
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
					curNode = tmp
					tmp+=1
					
					play_sound(PUTDOWN_SOUNDS)
						
			for child in glassNode:
				var distance = global_position.distance_to(child.global_position)
					
				if distance < shortest_dist && curVar<2 && not child.isFilled():
					child.select()
					curVar+=1
					switchTexture()
					emit_signal("addDrink")
					
					play_sound(POUR_SOUNDS)

func getProperties():
	return properties

func switchTexture():
	if(curVar==0):
		bottleSprite.set_texture(fullTex)
	elif(curVar==1):
		bottleSprite.set_texture(halfTex)
	elif(curVar==2):
		bottleSprite.set_texture(emptyTex)
 
