extends Control

onready var quit_button = get_node("Background/CenterContainer/VBoxContainer/Quit")
onready var continue_button = get_node("Background/CenterContainer/VBoxContainer/Continue")
onready var restart_button = get_node("Background/CenterContainer/VBoxContainer/RestartPause")
var quit = preload("res://buttons/button_quit.png")
var quit_hovered = preload("res://buttons/button_quit_highlight.png")
var continu = preload("res://buttons/button_resume.png")
var continu_hovered = preload("res://buttons/button_resume_highlight.png")
var restart = preload("res://buttons/button_restart.png")
var restart_hovered = preload("res://buttons/button_restart_highlight.png")

var is_paused = false setget set_is_paused
func _onready():
	self.set_global_position(Vector2(1000,800))
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.is_paused = !is_paused
	
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Continue_pressed():
	self.is_paused = false
	pass # Replace with function body.


func _on_Quit_pressed():
	self.is_paused = false
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://TRY.tscn")
	pass # Replace with function body.


func _on_RestartPause_pressed():
	self.is_paused = false
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().reload_current_scene()


func _on_Continue_mouse_entered():
	continue_button.set_button_icon(continu_hovered)
	pass # Replace with function body.


func _on_Continue_mouse_exited():
	continue_button.set_button_icon(continu)
	pass # Replace with function body.


func _on_RestartPause_mouse_entered():
	restart_button.set_button_icon(restart_hovered)
	pass # Replace with function body.


func _on_RestartPause_mouse_exited():
	restart_button.set_button_icon(restart)
	pass # Replace with function body.


func _on_Quit_mouse_entered():
	quit_button.set_button_icon(quit_hovered)
	pass # Replace with function body.


func _on_Quit_mouse_exited():
	quit_button.set_button_icon(quit)
	pass # Replace with function body.
