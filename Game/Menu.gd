extends Control


export(Script) var Game_save
var play = preload("res://buttons/Button_Play.png")
var play_hovered = preload("res://buttons/Button_Play_Highlight.png")
var settings = preload("res://buttons/button_settings.png")
var settings_hovered = preload("res://buttons/button_settings_highlight.png")
var quit = preload("res://buttons/button_quit.png")
var quit_hovered = preload("res://buttons/button_quit_highlight.png")
onready var play_button = get_node("VBoxContainer/NewGame")
onready var settings_button = get_node("VBoxContainer/Settings")
onready var quit_button = get_node("VBoxContainer/Exit")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	if (Data.loaded == false):
		load_save()
	else:
		pass
	Music.get_node("soundtrack").play(Data.music)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func verify_save():
	pass
func new_save():
	var save = Game_save.new()
	save.level1 = Data.level1
	save.level2 = Data.level2
	save.level3 = Data.level3
	save.music_volume = Data.music_volume
	save.sound_value = Data.sound_value
	save.sfx_value = Data.sfx_value
	save.music_toggle = Data.music_toggle
	save.sfx_toggle = Data.sfx_toggle
	var dir = Directory.new()
	if (dir.dir_exists("user://saves/") == false):
		dir.make_dir_recursive("user://saves/")
		ResourceSaver.save("user://saves/saved_game.tres" , save)
	else:
		ResourceSaver.save("user://saves/saved_game.tres" , save)
func load_save():
	var dir = Directory.new()
	if (dir.file_exists("user://saves/saved_game.tres") == true):
		var save = load("user://saves/saved_game.tres")
		Data.level1 = save.level1
		Data.level2 = save.level2
		Data.level3 = save.level3
		Data.music_volume = save.music_volume
		Data.sound_value = save.sound_value
		Data.sfx_value = save.sfx_value
		Data.music_toggle = save.music_toggle
		Data.sfx_toggle = save.sfx_toggle
		get_tree().change_scene("res://Settings.tscn")
		
	else:
		pass
	pass




func _on_Exit_pressed():
	new_save()
	get_tree().quit()
	pass # Replace with function body.


func _on_Settings_pressed():
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://Settings.tscn")
	pass # Replace with function body.


func _on_NewGame_pressed():
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://LevelPicker.tscn")
	pass # Replace with function body.


func _on_NewGame_mouse_entered():
	play_button.set_button_icon(play_hovered)
	pass # Replace with function body.


func _on_NewGame_mouse_exited():
	play_button.set_button_icon(play)
	pass # Replace with function body.


func _on_Settings_mouse_entered():
	settings_button.set_button_icon(settings_hovered)
	pass # Replace with function body.


func _on_Settings_mouse_exited():
	settings_button.set_button_icon(settings)
	pass # Replace with function body.


func _on_Exit_mouse_entered():
	quit_button.set_button_icon(quit_hovered)
	pass # Replace with function body.


func _on_Exit_mouse_exited():
	quit_button.set_button_icon(quit)
	pass # Replace with function body.
