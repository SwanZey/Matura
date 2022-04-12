extends Control


var paused = false setget set_paused

onready var restart_button = get_node("ColorRect/CenterContainer/VBoxContainer/RestartDead")
onready var quit_button = get_node("ColorRect/CenterContainer/VBoxContainer/Quit")
var restart = preload("res://buttons/button_restart.png")
var restart_hovered = preload("res://buttons/button_restart_highlight.png")
var quit = preload("res://buttons/button_quit.png")
var quit_hovered = preload("res://buttons/button_quit_highlight.png")



func set_paused(value):
	paused = value
	get_tree().paused = paused
	visible = paused
	

func _on_RestartDead_pressed():
	self.paused = false
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().reload_current_scene()


func _on_Quit_pressed():
	self.paused = false
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://LevelPicker.tscn")

func _on_Polygon2D_dead():
	self.paused = true
	pass # Replace with function body.





func _on_RestartDead_mouse_entered():
	restart_button.set_button_icon(restart_hovered)
	pass # Replace with function body.


func _on_RestartDead_mouse_exited():
	restart_button.set_button_icon(restart_hovered)
	pass # Replace with function body.


func _on_Quit_mouse_entered():
	quit_button.set_button_icon(quit_hovered)
	pass # Replace with function body.


func _on_Quit_mouse_exited():
	quit_button.set_button_icon(quit)
	pass # Replace with function body.
