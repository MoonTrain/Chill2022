extends Node

var redFull = preload("res://art/Full-Red.png")
var redHalf = preload("res://art/Half-Red.png")
var emptyRound = preload("res://art/Empty.png")

var waterFull = preload("res://art/ingredientWater.png")
var waterHalf = preload("res://art/ingredientWaterHalf.png")
var waterEmpty = preload("res://art/ingredientWaterEmpty.png")

var lemonFull = preload("res://art/ingredientLemon.png")
var lemonHalf = preload("res://art/IngredientLemonHalf.png")
var lemonEmpty = preload("res://art/ingredientLemonEmpty.png")

var radiumFull = preload("res://art/ingredientRadium.png")
var radiumHalf = preload("res://art/ingredientRadiumHalf.png")
var radiumEmpty = preload("res://art/ingredientRadiumEmpty.png")

var spicyFull = preload("res://art/ingredientSriracha.png")
var spicyHalf = preload("res://art/ingredientSrirachaHalf.png")
var spicyEmpty = preload("res://art/ingredientSrirachaEmpty.png")

var syrupFull = preload("res://art/ingredientSyrup.png")
var syrupHalf = preload("res://art/IngredientSyrupHalf.png")
var syrupEmpty = preload("res://art/IngredientSyrupEmpty.png")
	

var potList = []
var money = 0
var curMix = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var request = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# Called when the node enters the scene tree for the first time.
func _ready():
	potList = get_tree().get_nodes_in_group("potList")
	var iterCt = 0
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
		if(iterCt==0):
			child.init(attrib, waterFull, waterHalf, waterEmpty)
		elif(iterCt==1):
			child.init(attrib, lemonFull, lemonHalf, lemonEmpty)
		elif(iterCt==2):
			child.init(attrib, radiumFull, radiumHalf, radiumEmpty)
		elif(iterCt==3):
			child.init(attrib, spicyFull, spicyHalf, spicyEmpty)
		elif(iterCt==4):
			child.init(attrib, syrupFull, syrupHalf, syrupEmpty)
		else:
			child.init(attrib, waterFull, waterHalf, waterEmpty)
		iterCt+=1

#func makeRequest():
#	request = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
#	for i in range(0, 4):
#		request[int(rand_range(0, 9))]+=1

func submitMix():
	var income = 0
	for i in range(0, 9):
		income += $Customer.order_mix[i] * curMix[i]
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
#	makeRequest()
	for i in request:
		print(i)


func _on_RedPot3_addDrink():
	print("Adding Mix")
	var toAdd = $RedPot3.getProperties()
	var pos = 0
	for i in toAdd:
		curMix[pos]+=i
		pos+=1


func _on_RedPot4_addDrink():
	print("Adding Mix")
	var toAdd = $RedPot4.getProperties()
	var pos = 0
	for i in toAdd:
		curMix[pos]+=i
		pos+=1


func _on_RedPot5_addDrink():
	print("Adding Mix")
	var toAdd = $RedPot5.getProperties()
	var pos = 0
	for i in toAdd:
		curMix[pos]+=i
		pos+=1


func _on_RedPot6_addDrink():
	print("Adding Mix")
	var toAdd = $RedPot6.getProperties()
	var pos = 0
	for i in toAdd:
		curMix[pos]+=i
		pos+=1
