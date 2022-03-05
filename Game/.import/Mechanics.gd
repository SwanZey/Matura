extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal dead
# Called when the node enters the scene tree for the first time.
onready var life = 3

onready var map = get_node("TileMap")
onready var time = get_node("Label")
var target
var cell
func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()
		print (target);

func _process(delta):
	pass


func _on_Timer_timeout():
	print("ran out")
	var text = time.get_text()
	var text_int = int(text)
	text_int -= 1
	text = str(text_int)
	time.set_text(text)
	get_node("Label/Timer").start(1)
	pass # Replace with function body.


func _on_TileMap_dead():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.
