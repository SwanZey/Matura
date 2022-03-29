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


func _on_Level1_pressed():
	get_tree().change_scene("res://Level1.tscn")
	pass # Replace with function body.


func _on_Level2_pressed():
	#get_tree().change_scene_to(level2)
	pass # Replace with function body.


func _on_Level3_pressed():
	pass # Replace with function body.


func _on_Level4_pressed():
	pass # Replace with function body.


func _on_Level5_pressed():
	pass # Replace with function body.


func _on_Level6_pressed():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://TRY.tscn")
