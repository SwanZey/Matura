extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("SFXlevel").set_value(Data.sfx_value)
	get_node("Soundlevel").set_value(Data.sound_value)
	get_node("SFXon").set_pressed(Data.sfx_toggle)
	get_node("Soundon").set_pressed(Data.music_toggle)
	print(Data.loaded)
	if (Data.loaded == false):
		Data.loaded = true
		print("true")
		get_tree().change_scene("res://TRY.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Soundlevel_value_changed(value):
	get_node("SoundValue").set_text(str(value))
	Data.music_volume = value -80.0
	Data.sound_value = value
	Music.get_node("soundtrack").set_volume_db(Data.music_volume)
	pass # Replace with function body.


func _on_SFXlevel_value_changed(value):
	get_node("SFXValue").set_text(str(value))
	Data.sfx_value = value
	pass # Replace with function body.
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		Data.music = Music.get_node("soundtrack").get_playback_position()
		get_tree().change_scene("res://TRY.tscn")


func _on_Soundon_toggled(button_pressed):
	print(button_pressed)
	if (button_pressed == false):
		Data.music_toggle = false
		Music.get_node("soundtrack").set_volume_db(Data.music_turnedoff)
	else :
		Data.music_toggle = true
		Music.get_node("soundtrack").set_volume_db(Data.music_volume)
	pass # Replace with function body.


func _on_SFXon_toggled(button_pressed):
	if (button_pressed == false):
		Data.sfx_toggle = false
	else :
		Data.sfx_toggle = true
	pass # Replace with function body.


func _on_Back_pressed():
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://TRY.tscn")
	pass # Replace with function body.


func _on_Delete_pressed():
	var dir = Directory.new()
	if (dir.file_exists("res://saves/saved_game.tres") == true):
		dir.remove("res://saves/saved_game.tres")
		Data.level1 = false
		Data.level2 = false
		Data.level3 = false
	else :
		pass
	pass # Replace with function body.
