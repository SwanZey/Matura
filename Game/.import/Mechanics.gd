extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal dead
signal victory
# Called when the node enters the scene tree for the first time.
onready var life = 3

onready var map = get_node("TileMap")
onready var time = get_node("GUI").get_node("Timer")
var target
var cell
func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()

func _ready():
	Music.get_node("soundtrack").play(Data.music)

func _process(delta):
	pass



func _on_Timer_timeout():
	var text = time.get_text()
	var text_int = int(text)
	text_int -= 1
	text = str(text_int)
	if (text_int == 0):
		emit_signal("dead")
	time.set_text(text)
	get_node("Timer").start(1)
	pass # Replace with function body.














func _on_TileMap_dead():
	emit_signal("dead")
	pass # Replace with function body.


func _on_TileMap_victory():
	if (Data.current_level == "level1"):
		Data.level1 = true
	elif (Data.current_level == "level2"):
		Data.level2 = true
	else:
		Data.level3 = true
	emit_signal("victory")
	pass # Replace with function body.



