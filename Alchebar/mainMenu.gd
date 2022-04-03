extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_startButton_pressed():
	if $menu/ClickAudio.playing == false:	$menu/ClickAudio.play()
	OS.delay_msec(500)
	get_tree().change_scene("res://Node.tscn")

func _on_startButton_mouse_entered():
	if $menu/MouseOverAudio.playing == false:	$menu/MouseOverAudio.play()

func _on_optionsButton_pressed():
	if $menu/ClickAudio.playing == false:	$menu/ClickAudio.play()


func _on_quitButton_pressed():
	if $menu/ClickAudio.playing == false:	$menu/ClickAudio.play()
	get_tree().quit()


func _on_startButton_focus_entered():
	$menu/MouseOverAudio.play()

func _on_optionsButton_mouse_entered():
	$menu/MouseOverAudio.play()

func _on_quitButton_mouse_entered():
	$menu/MouseOverAudio.play()
