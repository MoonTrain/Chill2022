extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var potList = []
var money = 0
var curMix = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var request = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
# Called when the node enters the scene tree for the first time.
func _ready():
	potList = get_tree().get_nodes_in_group("potList")
	for child in potList:
		var attrib = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		var flav1 = int(rand_range(0, 9))
		var flav2 = int(rand_range(0, 9))
		var flav3 = int(rand_range(0, 9))
		var flav4 = int(rand_range(0, 9))
		attrib[flav1]+=1
		attrib[flav2]+=1
		attrib[flav3]+=1
		attrib[flav4]+=1
		
		child.init(attrib, "RED")

func makeRequest():
	request = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for i in range(0, 4):
		request[int(rand_range(0, 9))]+=1

func submitMix():
	var income = 0
	for i in range(0, 9):
		income+=request[i]*curMix[i]
	money+=income
	print("Earned ", str(income))


func _on_RedPot_addDrink():
	print("Adding Mix")
	var toAdd = $RedPot.getProperties()
	var pos = 0
	for i in toAdd:
		curMix[pos]+=i
		pos+=1

func _on_RedPot2_addDrink():
	print("Adding Mix")
	var toAdd = $RedPot2.getProperties()
	var pos = 0
	for i in toAdd:
		curMix[pos]+=i
		pos+=1


func _on_DropDrink_serveDrink():
	submitMix()
	makeRequest()
	for i in request:
		print(i)
