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


signal end_turn

var board_cards = [0,1,2,3,4 ]

func _ready():
	make_tiles_interactable()
	Events.connect("start_board_turn", self, "start_board_turn")

func start_board_turn():
	Global.is_player_turn = false
	
	#this is where we would put all of the board's actions
	print("currently, it is the board's turn")
	yield(get_tree().create_timer(3), "timeout")
	#Choose an event card at end of board turn
	var rand_card:int = randi() % board_cards.size()
	if(rand_card == 0):
		_card_1()
	elif(rand_card == 1):
		_card_2()
	elif(rand_card == 2):
		_card_3()
	elif(rand_card == 3):
		_card_4()
	elif(rand_card == 4):
		_card_5()

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
	tween.interpolate_property(tile_object.get_parent(), "translation", from, to, 0.1)
	tile_object.get_parent().add_child(tween)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()

func _card_1():
	Global.flavor_text = str("A DUST STORM REVEALED HIDDEN TREASURE.")
	Global.functional_text = str("EVENT CARD: SPAWN DESERT RESOURCES")
	
	#Referencing variable in EventBus.gd
	Events.emit_signal("spawn_gold")
	Events.emit_signal("spawn_incense")
	
	print("Spawn Incense and Gold")
	_end_board_turn()
	
func _card_2():
	Global.flavor_text = str("THE ROBBER GOT A DROP ON A SHIPMENT")
	Global.functional_text = str("MOVE ROBBER X SQUARES")
	_end_board_turn()
	
func _card_3():
	Global.flavor_text = str("A BOUNTIFUL HARVEST THIS YEAR YIELDS MORE RESOURCES")
	Global.functional_text = str("SPAWN GRASSLAND RESOURCES")
	Events.emit_signal("spawn_grapes")
	Events.emit_signal("spawn_wheat")
	print("Spawn Wheat and Grapes")
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
