extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mapa = get_parent().get_node("TileMap")
onready var map_tileset = mapa.get_tileset()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func sloupec(id):
	var pocet = 0
	var kolikrat = 0
	for i in range (24,4,-1):
		var radek = float(i)
		var sloup = id
		var tile_pos = Vector2(sloup,radek)
		var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
		if (tile_name == "wrong") or (tile_name == "wrong_clicked") or (tile_name == "wrong_fill") :
			if (pocet >= 1):
				var cislo_pos = Vector2(sloup,4-kolikrat)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(String(pocet)))
				pocet = 0
				kolikrat += 1
			elif (pocet == 0) && (kolikrat == 0) && (radek == 5):
				var cislo_pos = Vector2(sloup,4-kolikrat)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(String(pocet)+"_completed"))
				sloupec_vyplnit(sloup)
				
		elif (pocet == 19) :
			var cislo_pos = Vector2(sloup,4-kolikrat)
			self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name("20"))
		elif (pocet >= 0) && (radek == 5):
			pocet += 1
			var cislo_pos = Vector2(sloup,4-kolikrat)
			self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(String(pocet)))
		else:
			pocet += 1
	pass

func radek(id):
	var pocet = 0
	var kolikrat = 0
	for i in range (38,18,-1):
		var sloup = float(i)
		var radek = id
		var tile_pos = Vector2(sloup,radek)
		var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
		if (tile_name == "wrong") or (tile_name == "wrong_clicked") or (tile_name == "wrong_fill") :
			if (pocet >= 1):
				var cislo_pos = Vector2(18-kolikrat,radek)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(String(pocet)))
				pocet = 0
				kolikrat += 1
			elif (pocet == 0) && (kolikrat == 0) && (sloup == 19):
				var cislo_pos = Vector2(18-kolikrat,radek)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(String(pocet)+"_completed"))
				radek_vyplnit(radek)
		elif (pocet == 19) :
			var cislo_pos = Vector2(18-kolikrat,radek)
			self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name("20"))
		elif (pocet >= 0) && (sloup == 19):
			pocet += 1
			var cislo_pos = Vector2(18-kolikrat,radek)
			self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(String(pocet)))
		else:
			pocet += 1
	pass

func sloupec_splneno(id):
	var narazilo = false
	var pocet = 0
	var kolikrat = 0
	for i in range (24,4,-1):
		var cislo_pos = Vector2(id,4-kolikrat)
		var radek = float(i)
		var sloup = id
		var tile_pos = Vector2(sloup,radek)
		var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
		if (tile_name == "1_clicked") or (tile_name == "2_clicked") or (tile_name == "3_clicked") or (tile_name == "4_clicked"):
			narazilo = true
			pocet += 1
			if  (radek == 5) && (String(pocet) ==self.get_tileset().tile_get_name(self.get_cellv(cislo_pos))) :
				pocet = String(pocet)
				pocet =pocet + "_completed"
				print(pocet)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(pocet))
				pocet = 0
		else:
			if (tile_name == "1") || (tile_name == "2") || (tile_name == "3") || (tile_name == "4") :
				narazilo = true
			if (String(pocet) ==self.get_tileset().tile_get_name(self.get_cellv(cislo_pos))) :
				pocet = String(pocet)
				pocet =pocet + "_completed"
				print(pocet)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(pocet))
				pocet = 0
			if (narazilo == true):
				if (tile_name == "wrong") || (tile_name == "wrong_clicked") || (tile_name == "wrong_fill"):
					kolikrat += 1
					pocet = 0
					narazilo = false
	pass
	pass

func radek_splneno(id):
	var narazilo = false
	var pocet = 0
	var kolikrat = 0
	for i in range (38,18,-1):
		var cislo_pos = Vector2(18-kolikrat,id)
		var sloup = float(i)
		var radek = id
		var tile_pos = Vector2(sloup,radek)
		var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
		if (tile_name == "1_clicked") or (tile_name == "2_clicked") or (tile_name == "3_clicked") or (tile_name == "4_clicked"):
			narazilo = true
			pocet += 1
			if  (sloup == 19) && (String(pocet) ==self.get_tileset().tile_get_name(self.get_cellv(cislo_pos))) :
				pocet = String(pocet)
				pocet =pocet + "_completed"
				print(pocet)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(pocet))
				pocet = 0
		else:
			if (tile_name == "1") || (tile_name == "2") || (tile_name == "3") || (tile_name == "4") :
				narazilo = true
			if (String(pocet) ==self.get_tileset().tile_get_name(self.get_cellv(cislo_pos))) :
				pocet = String(pocet)
				pocet =pocet + "_completed"
				print(pocet)
				self.set_cellv(cislo_pos, self.get_tileset().find_tile_by_name(pocet))
				pocet = 0
			if (narazilo == true):
				if (tile_name == "wrong") || (tile_name == "wrong_clicked") || (tile_name == "wrong_fill") :
					kolikrat += 1
					pocet = 0
					narazilo = false
	pass

func sloupec_vyplnit(id):
	var narazilo = false
	for i in range (24,4,-1):
		var radek = float(i)
		var sloup = id
		var tile_pos = Vector2(sloup,radek)
		var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
		if (tile_name!= "1") && (tile_name!= "2") && (tile_name!= "3") && (tile_name!= "4") :
			pass
		else :
			narazilo = true
	if (narazilo == false) :
		for i in range (24,4,-1):
			var radek = float(i)
			var sloup = id
			var tile_pos = Vector2(sloup,radek)
			var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
			if (tile_name == "wrong"):
				get_parent().get_node("TileMap").set_cellv(tile_pos, get_parent().get_node("TileMap").get_tileset().find_tile_by_name("wrong_fill"))
	pass
	
func radek_vyplnit(id):
	var narazilo = false
	for i in range (38,18,-1):
		var sloup = float(i)
		var radek = id
		var tile_pos = Vector2(sloup,radek)
		var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
		if (tile_name!= "1") && (tile_name!= "2") && (tile_name!= "3") && (tile_name!= "4") :
			pass
		else :
			narazilo = true
	if (narazilo == false) :
		for i in range (38,18,-1):
			var sloup = float(i)
			var radek = id
			var tile_pos = Vector2(sloup,radek)
			var tile_name = get_parent().get_node("TileMap").get_tileset().tile_get_name(get_parent().get_node("TileMap").get_cellv(tile_pos))
			if (tile_name == "wrong"):
				get_parent().get_node("TileMap").set_cellv(tile_pos, get_parent().get_node("TileMap").get_tileset().find_tile_by_name("wrong_fill"))
	pass
	
	
	
func _on_TileMap_check(tile_pos):
	var sloup_float = float(tile_pos[0][0])
	var radek_float = float(tile_pos[0][1])
	sloupec(sloup_float)
	radek(radek_float)
	pass # Replace with function body.


func _on_TileMap_clicked(tile_pos):
	var sloup_float = float(tile_pos[0][0])
	var radek_float = float(tile_pos[0][1])
	sloupec_splneno(sloup_float)
	radek_splneno(radek_float)
	sloupec_vyplnit(sloup_float)
	radek_vyplnit(radek_float)
	pass # Replace with function body.
