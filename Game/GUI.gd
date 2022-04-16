extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal gameover

# Called when the node enters the scene tree for the first time.
func _ready():
	if Data.current_level == "level1":
		get_node("Count").set_text("142")
	elif Data.current_level == "level2":
		get_node("Count").set_text("70")
	elif Data.current_level == "level3":
		get_node("Count").set_text("54")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_TileMap_dead():
	emit_signal("gameover")
	pass # Replace with function body.
