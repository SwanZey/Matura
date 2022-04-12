extends Control


var paused = false setget set_paused


onready var quit_button = get_node("ColorRect/CenterContainer/VBoxContainer/Quit")
var quit = preload("res://buttons/button_quit.png")
var quit_hovered = preload("res://buttons/button_quit_highlight.png")



func set_paused(value):
	paused = value
	get_tree().paused = paused
	visible = paused
	

func _on_Quit_pressed():
	self.paused = false
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://TRY.tscn")

func _on_Polygon2D_victory():
	self.paused = true
	pass # Replace with function body.









func _on_Quit_mouse_entered():
	pass # Replace with function body.


func _on_Quit_mouse_exited():
	pass # Replace with function body.
