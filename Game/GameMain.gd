extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var life = 3
var timer = get_node("Polygon2D").get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.






func _on_Polygon2D_dead():
	pass # Replace with function body.
