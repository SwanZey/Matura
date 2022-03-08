extends Control


var paused = false setget set_paused

func set_paused(value):
	paused = value
	get_tree().paused = paused
	visible = paused
	

func _on_RestartDead_pressed():
	self.paused = false
	get_tree().reload_current_scene()


func _on_Quit_pressed():
	get_tree().quit()


func _on_GUI_gameover():
	self.paused = true
