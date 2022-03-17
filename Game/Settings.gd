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


func _on_Button_pressed():
	get_tree().change_scene("res://TRY.tscn")
	pass # Replace with function body.


func _on_Soundlevel_value_changed(value):
	get_node("SoundValue").set_text(str(value))
	pass # Replace with function body.


func _on_SFXlevel_value_changed(value):
	get_node("SFXValue").set_text(str(value))
	pass # Replace with function body.
