extends Control

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
	var menu = preload("res://TRY.tscn").instance()
	get_tree().change_scene_to(menu)
	pass # Replace with function body.


func _on_RestartPause_pressed():
	self.is_paused = false
	get_tree().reload_current_scene()
