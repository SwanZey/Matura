extends Control

var level1_image = preload("res://Levels/2020Blade_Resized.png")
var level2_image = preload("res://Levels/2020Hilt_Resized.png")
var level3_image = preload("res://Levels/2020hilt2_resized.png")
onready var level1_button = get_node("Level1")
onready var level2_button = get_node("Level2")
onready var level3_button = get_node("Level3")
onready var sword = get_node("sword")
onready var sword_hidden = get_node("sword_hidden")
# Called when the node enters the scene tree for the first time.
func _ready():
	if Data.level1 == true:
		level1_button.set_button_icon(level1_image)
		level1_button.rect_scale = Vector2 (0.25,0.25)
	if Data.level2 == true:
		level2_button.set_button_icon(level2_image)
		level2_button.rect_scale = Vector2 (0.25,0.25)
	if Data.level3 == true:
		level3_button.set_button_icon(level3_image)
		level3_button.rect_scale = Vector2 (0.25,0.25)
		sword.visible = true
		sword_hidden.visible = false
	Music.get_node("soundtrack").play(Data.music)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Level1_pressed():
	Data.current_level = "level1"
	Data.music = Music.get_node("soundtrack").get_playback_position()
	get_tree().change_scene("res://Level1.tscn")
	pass # Replace with function body.


func _on_Level2_pressed():
	Data.current_level = "level2"
	Data.music = Music.get_node("soundtrack").get_playback_position()
	if (Data.level1 == true):
		get_tree().change_scene("res://Level2.tscn")
	else:
		pass
	pass # Replace with function body.


func _on_Level3_pressed():
	Data.current_level = "level3"
	Data.music = Music.get_node("soundtrack").get_playback_position()
	if (Data.level2 == true):
		get_tree().change_scene("res://Level3.tscn")
	else:
		pass
	pass # Replace with function body.


func _on_Level4_pressed():
	pass # Replace with function body.


func _on_Level5_pressed():
	pass # Replace with function body.


func _on_Level6_pressed():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		Data.music = Music.get_node("soundtrack").get_playback_position()
		get_tree().change_scene("res://TRY.tscn")
