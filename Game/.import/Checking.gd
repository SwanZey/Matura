extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal dead
# Called when the node enters the scene tree for the first time.
func _ready():
	var tileset = self.get_tileset()
	var tiles = get_used_cells()
	set_process_input(true)
	
	
# self.set_cellv(tile_pos, self.get_tileset().find_tile_by_name("1-4"))	
	
	

func _input(event):
	var tile_pos = self.world_to_map(get_global_mouse_position())
	if event.is_action_pressed("click"):
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
			elif tile_name == "wrong_clicked" or "1_clicked":
				pass
			else:
				tile_name+="_clicked"
				self.set_cellv(tile_pos, self.get_tileset().find_tile_by_name(tile_name))
				pass

