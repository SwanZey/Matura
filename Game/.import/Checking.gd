extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drag = false 
signal check
signal dead
signal clicked
signal victory
onready var Mouse = get_parent().get_node("Mouse")
onready var pocet = get_parent().get_node("GUI/Count")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range (20):
		var check_pos = [(19+i),(5+i)]
		emit_signal("check", [check_pos])
# self.set_cellv(tile_pos, self.get_tileset().find_tile_by_name("1-4"))	
	
func _process(delta):
	if drag == true:
		if Mouse.get_time_left() == 0.00 || Mouse.is_stopped():
			Mouse.start(0.06)
	else:
		Mouse.stop()
	pass
	

func _input(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_action_pressed("click") == true :
		drag = true
	elif event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_action_released("click") == true :
		drag = false
	pass
	
	
	
	
	



func _on_Mouse_timeout():
	var tile_pos = self.world_to_map(get_global_mouse_position())
	if self.get_cellv(tile_pos) != -1:
		var tile_name = self.tile_set.tile_get_name(self.get_cellv(tile_pos))
		if tile_name == "wrong":
			tile_name +="_clicked"
			var life = get_parent().life
			life -= 1
			get_parent().life = life
			var text = str(life)
			get_parent().get_node("GUI").get_node("Lives").set_text(text)
			self.set_cellv(tile_pos, self.get_tileset().find_tile_by_name(tile_name))
			if life == 0:
				print("game over")
				emit_signal("dead")
		elif tile_name == "wrong_clicked" or tile_name == "1_clicked" or tile_name == "2_clicked" or tile_name == "3_clicked" or tile_name == "4_clicked" or tile_name == "wrong_fill":
			pass
		else:
			tile_name += "_clicked"
			self.set_cellv(tile_pos, self.get_tileset().find_tile_by_name(tile_name))
			emit_signal("clicked", [tile_pos])
			var cislo = int(pocet.get_text())
			if (cislo == 1):
				cislo -= 1
				emit_signal("victory")
			else:
				cislo -= 1
				pocet.set_text(String(cislo))
			pass
	pass
