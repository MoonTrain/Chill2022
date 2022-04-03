extends CanvasLayer
signal timeUp

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 300
	$Timer.start()
	updateTime()

func updateRequest(var r):
	pass

func updateMoney(var m):
	$MoneyLabel.text = "Cash: " + str(m)

func updateTime():
	$Time.text = str(timer)

func _on_Timer_timeout():
	timer -= 1
	if(timer==0):
		emit_signal("timeUp")
	updateTime()
