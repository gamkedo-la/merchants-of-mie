extends Node

export var city_Name = "CITY_NAME"
export var resource_value_silver = 3
export var resource_value_gold = 3
export var resource_value_salt = 3
export var resource_value_grapes = 3
export var resource_value_wheat = 3
export var resource_value_tea = 3
export var resource_value_marble = 3
export var resource_value_incense = 3
export var resource_value_diamonds = 3
export var resource_value_fish = 3
export var resource_value_lumber = 3
export var resource_value_dyes = 3
export var resource_value_coffee = 3

onready var dead_click_sfx: AudioStream = preload("res://Audio/SFX/err_click.wav")

# warning-ignore:unused_signal
signal end_turn

var board_cards = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

func _ready():
	make_tiles_interactable()
	if not Events.is_connected("start_board_turn", self, "start_board_turn"):
		var con_res = Events.connect("start_board_turn", self, "start_board_turn")
		assert(con_res == OK)

func start_board_turn():
	Global.is_player_turn = false
	
	#this is where we would put all of the board's actions
	print("currently, it is the board's turn")
	yield(get_tree().create_timer(3), "timeout")
	#Choose an event card at end of board turn
	determine_card()

func determine_card():
	var rand_card:int = randi() % board_cards.size()
	if(board_cards[rand_card] == 0):
		determine_card()
	else:
		if(rand_card == 0):
			_spawn_Gold_Incense()
			board_cards[0] = 0
		elif(rand_card == 1):
			_spawn_marble_lumber()
			board_cards[1] = 0
		elif(rand_card == 2):
			_spawn_grassland()
			board_cards[2] = 0
		elif(rand_card == 3):
			_spawn_fish()
			board_cards[3] = 0
		elif(rand_card == 4):
			_spawn_diamonds_gold_silver()
			board_cards[4] = 0
		elif(rand_card == 5):
			_spawn_salt()
			board_cards[5] = 0
		elif(rand_card == 6):
			_spawn_coffee()
			board_cards[6] = 0
		elif(rand_card == 7):
			_spawn_dyes_tea()
			board_cards[7] = 0
		elif(rand_card == 8):
			_spawn_coffee_wheat()
			board_cards[8] = 0
		elif(rand_card == 9):
			_spawn_salt_incense()
			board_cards[9] = 0
		elif(rand_card == 10):
			_spawn_silver_dyes_diamonds()
			board_cards[10] = 0
		elif(rand_card == 11):
			_spawn_trees()
			board_cards[11] = 0
		elif(rand_card == 12):
			_spawn_grapes()
			board_cards[12] = 0
		elif(rand_card == 13):
			_spawn_marble()
			board_cards[13] = 0
		elif(rand_card == 14):
			_card_4()
			board_cards[14] = 0
		elif(rand_card == 15):
			_card_5()
			board_cards[15] = 0


func make_tiles_interactable():
	for tile in $BoardTiles.get_children():
		if tile is Spatial and not tile is CSGBox:
			var static_body = StaticBody.new()
			var box_collision_shape = CollisionShape.new()
			box_collision_shape.shape = BoxShape.new()
			box_collision_shape.translation.y = -1.0
			static_body.collision_layer = 2

			static_body.add_child(box_collision_shape)
			tile.add_child(static_body)

			static_body.add_user_signal("tile_hovered")
			static_body.connect("tile_hovered", self, "_tile_hovered")

			static_body.add_user_signal("tile_unhovered")
			static_body.connect("tile_unhovered", self, "_tile_unhovered")

			static_body.add_user_signal("tile_clicked")
			static_body.connect("tile_clicked", self, "_tile_clicked")

func is_valid_movement_tile(from_vector: Vector3, desired_move_vector: Vector3) -> bool:
	if Global.action_Points_available <= 0:
		return false
	if SettingsManager.one_tile_per_move():
		var board_map = get_parent().get_node("AMap")
		var path_cost = board_map.get_path_cost(from_vector, desired_move_vector)
		return path_cost <= Global.action_Points_available
	return true
	

func _tile_hovered(tile_object):
	var tween = Tween.new()
	var from = tile_object.get_parent().translation
	var to = Vector3(from.x, 0.2, from.z)
	var players = get_tree().get_nodes_in_group("player")
	var current_player_location;
	for player in players:
		if player.active_merchant == true:
			current_player_location = player.global_transform.origin;
	if (!is_valid_movement_tile(from, current_player_location)): return;
	tween.interpolate_property(tile_object.get_parent(), "translation", from, to, 0.1)
	tile_object.get_parent().add_child(tween)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()

func _tile_unhovered(tile_object):
	if !tile_object:
		return
	var tween = Tween.new()
	var from = tile_object.get_parent().translation
	var to = Vector3(from.x, 0, from.z)
	tween.interpolate_property(tile_object.get_parent(), "translation", from, to, 0.1)
	tile_object.get_parent().add_child(tween)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()

func _tile_clicked(tile_object):
	var tween = Tween.new()
	var from = tile_object.get_parent().translation
	var to = Vector3(from.x, 0.5, from.z)
	var players = get_tree().get_nodes_in_group("player")
	var current_player_location;
	for player in players:
		if player.active_merchant == true:
			current_player_location = player.global_transform.origin;
	if (!is_valid_movement_tile(from, current_player_location)): 
		SettingsManager.play_soundfx(dead_click_sfx)
		return;
	tween.interpolate_property(tile_object.get_parent(), "translation", from, to, 0.1)
	tile_object.get_parent().add_child(tween)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()

func _spawn_Gold_Incense():
	Global.flavor_text = str("A DUST STORM REVEALED HIDDEN TREASURE.")
	Global.functional_text = str("GOLD and INCENSE RESOURCES ADDED")
	#Referencing variable in EventBus.gd
	Events.emit_signal("spawn_gold")
	Events.emit_signal("spawn_incense")
	print("Spawn Incense and Gold")
	_end_board_turn()
	
func _spawn_grassland():
	Global.flavor_text = str("A BOUNTIFUL HARVEST YIELDED MORE RESOURCES")
	Global.functional_text = str("SPAWN GRASSLAND RESOURCES")
	Events.emit_signal("spawn_grapes")
	Events.emit_signal("spawn_wheat")
	Events.emit_signal("spawn_tea")
	_end_board_turn()
	
func _spawn_marble_lumber():
	Global.flavor_text = str("MORE EFFICIENT CONSTRUCTION METHODS FOUND")
	Global.functional_text = str("SPAWN CONSTRUCTION: MARBLE AND LUMBER")
	Events.emit_signal("spawn_lumber")
	Events.emit_signal("spawn_marble")
	_end_board_turn()	
	
func _spawn_fish():
	Global.flavor_text = str("A NEW FISHING LOCATION FOUND, DONT TELL ANYONE")
	Global.functional_text = str("SPAWN FISH")
	Events.emit_signal("spawn_fish")
	Events.emit_signal("spawn_fish")
	_end_board_turn()	
	
func _spawn_diamonds_gold_silver():
	Global.flavor_text = str("A NEW TREND IN PRECIOUS GEMS INCREASE DEMAND")
	Global.functional_text = str("SPAWN GOLD, DIAMONDS, SILVER")
	Events.emit_signal("spawn_gold")
	Events.emit_signal("spawn_diamond")
	Events.emit_signal("spawn_silver")
	_end_board_turn()	
	
func _spawn_salt():
	Global.flavor_text = str("THE QUEEN WANTED PICKLED FISH, NOW EVERYONE DOES")
	Global.functional_text = str("SPAWN SALT AND FISH")
	Events.emit_signal("spawn_salt")
	Events.emit_signal("spawn_fish")
	_end_board_turn()		
	
func _spawn_coffee():
	Global.flavor_text = str("WARM AND WET WEATHER CAUSED MORE COFFEE PRODUCTION")
	Global.functional_text = str("SPAWN COFFEE")
	Events.emit_signal("spawn_coffee")
	_end_board_turn()	

func _spawn_dyes_tea():
	Global.flavor_text = str("THE QUEEN'S FORMAL PARTY BROUGHT FASHION TO THE KINGDOM")
	Global.functional_text = str("SPAWN DYES AND TEA")
	Events.emit_signal("spawn_dyes")
	Events.emit_signal("spawn_tea")
	_end_board_turn()	

func _spawn_coffee_wheat():
	Global.flavor_text = str("WORKERS FOUND A FASTER BREAKFAST TO START THEIR DAY EARLY")
	Global.functional_text = str("SPAWN COFFEE AND WHEAT")
	Events.emit_signal("spawn_coffee")
	Events.emit_signal("spawn_wheat")
	_end_board_turn()	
	
func _spawn_salt_incense():
	Global.flavor_text = str("A MERCHANT LET SLIP OF RESOURCES IN THE DESERT")
	Global.functional_text = str("SPAWN SALT AND INCENSE")
	Events.emit_signal("spawn_salt")
	Events.emit_signal("spawn_incense")
	_end_board_turn()	
	
func _spawn_silver_dyes_diamonds():
	Global.flavor_text = str("THE FASHION SHOW OF GREENGLADE IS DRIVING JEWELRY SALES")
	Global.functional_text = str("SPAWN SILVER, DIAMONDS, DYES")
	Events.emit_signal("spawn_silver")
	Events.emit_signal("spawn_diamonds")
	Events.emit_signal("spawn_dyes")
	_end_board_turn()	

func _spawn_trees():
	Global.flavor_text = str("PLENTY OF RAINFALL CAUSED A SURPLUS OF TREES")
	Global.functional_text = str("SPAWN LUMBER")
	Events.emit_signal("spawn_lumber")
	Events.emit_signal("spawn_lumber")
	_end_board_turn()

func _spawn_grapes():
	Global.flavor_text = str("THE GRAPES BENEFITED FROM AN ABNORMALLY LONG SUMMER")
	Global.functional_text = str("SPAWN GRAPES")
	Events.emit_signal("spawn_grapes")
	Events.emit_signal("spawn_grapes")
	_end_board_turn()	
	
func _spawn_marble():
	Global.flavor_text = str("THE LOCAL ARTISAN SPARKED AN INTEREST IN SCULPTING")
	Global.functional_text = str("SPAWN MARBLE")
	Events.emit_signal("spawn_marble")
	Events.emit_signal("spawn_marble")
	_end_board_turn()			
		
func _card_4():
	var scarce_resource = Global.resource_names[randi() %  Global.resource_names.size()]
	var cities = get_tree().get_nodes_in_group("cities")
	var cityname_receiving_scarcity = cities[(randi() % cities.size())].city_name
	
	Global.flavor_text = str("THERE IS A DIRE NEED AT " + cityname_receiving_scarcity + " FOR MORE " + scarce_resource + " RESOURCE")
	Global.functional_text = str(cityname_receiving_scarcity + " IS PAYING MORE FOR " + scarce_resource + " RESOURCE")
		
	var city_names = get_tree().call_group("cities", "make_resource_scarce", cityname_receiving_scarcity, scarce_resource)
	_end_board_turn()
	
func _card_5():
	Global.flavor_text = str("X TOWN IS FACING A MYSTERY ILLNESS")
	Global.functional_text = str("TOWN X IS ON LOCKDOWN, NO ONE MAY ENTER OR LEAVE")
	_end_board_turn()

func _end_board_turn():
#	print("poke BoardCard")
#	$BoardCard.spawnCard()
	#yield(get_tree().create_timer(3), "timeout")
	print("these functions were moved to BoardCard -> onButtonPressed")
