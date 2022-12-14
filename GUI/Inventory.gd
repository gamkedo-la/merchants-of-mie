extends Control

var resources_in_inventory = []
var base_texture = preload("res://SharedResources/ResourceIcons/Base.png")
var coffee_texture = preload("res://SharedResources/ResourceIcons/Coffee.png")
var fish_texture = preload("res://SharedResources/ResourceIcons/Fish.png")
var gold_texture = preload("res://SharedResources/ResourceIcons/Gold.png")
var grapes_texture = preload("res://SharedResources/ResourceIcons/Grapes.png")
var incense_texture = preload("res://SharedResources/ResourceIcons/Incense.png")
var salt_texture = preload("res://SharedResources/ResourceIcons/Salt.png")
var wheat_texture = preload("res://SharedResources/ResourceIcons/Wheat.png")
var tea_texture = preload("res://SharedResources/ResourceIcons/Tea.png")
var marble_texture = preload("res://SharedResources/ResourceIcons/Marble.png")
var diamond_texture = preload("res://SharedResources/ResourceIcons/Diamond.png")
var dyes_texture = preload("res://SharedResources/ResourceIcons/Dyes.png")
var lumber_texture = preload("res://SharedResources/ResourceIcons/Lumber.png")

func _ready():
	Events.connect("resource_picked_up", self, "add_resource_to_inventory")
	Events.connect("resource_dropped", self, "remove_resource_from_inventory")
	Events.connect("resource_dropped_second", self, "remove_resources_from_inventory")
	#Selling to the city
	Events.connect("sell_inv_one", self, "sell_first_resource")
	Events.connect("sell_inv_two", self, "sell_second_resource")
	Events.connect("sell_inv_three", self, "sell_third_resource")
	#Updating global inventory (for selling)
	Events.connect("update_global_inventory_tracking", self, "update_global_inventory")

func add_resource_to_inventory(resource):
	var inventory_texture
	match resource:
		"Coffee":
			inventory_texture = coffee_texture
		"Fish":
			inventory_texture = fish_texture
		"Gold":
			inventory_texture = gold_texture
		"Grapes":
			inventory_texture = grapes_texture
		"Incense":
			inventory_texture = incense_texture
		"Salt":
			inventory_texture = salt_texture
		"Wheat":
			inventory_texture = wheat_texture
		"Tea":
			inventory_texture = tea_texture
		"Marble":
			inventory_texture = marble_texture
		"Diamond":
			inventory_texture = diamond_texture
		"Dyes":
			inventory_texture = dyes_texture
		"Lumber":
			inventory_texture = lumber_texture
	
	if resource in resources_in_inventory:
		print("You already have this resource in your inventory")
		return
	
	if resources_in_inventory.size() < 3:
		resources_in_inventory.append(resource)
		$VBoxContainer/HBoxContainer.get_child(resources_in_inventory.size()-1).texture = inventory_texture
		update_global_inventory()
		return
		
	print("Your inventory is full!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func remove_resource_from_inventory(resource):
	print("Merchant has arrived to the city carrying: ", resources_in_inventory)
	if((resources_in_inventory.size() == 1 && resource == resources_in_inventory[0]) || (resources_in_inventory.size() == 2 && (resource == resources_in_inventory[0] || resource == resources_in_inventory[1])) || (resources_in_inventory.size() == 3 && (resource == resources_in_inventory[0] || resource == resources_in_inventory[1] || resource == resources_in_inventory[2]))):
		if(Global.first_objective_completed == false):
			Global.objective_one_count -= 1
			if(Global.objective_one_count <= 0):
				Global.first_objective_completed = true
				print(Global.first_objective_completed)
		#Updates objectives in Global.gd
		Events.emit_signal("update_objectives")
		var idx = resources_in_inventory.find(resource, 0)
		print(str(idx))
		if idx != -1:
			resources_in_inventory.erase(resource)
			$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	else:
		print("No items in inventory match the objective")

func remove_resources_from_inventory(resource_2_1, resource_2_2, resource_2_3):
	print("Merchant has arrived to the city carrying: ", resources_in_inventory)
	print(resource_2_1, " ", resource_2_2, " ", resource_2_3)
	
	if((resources_in_inventory.size() == 1 && resource_2_1 == resources_in_inventory[0]) || (resources_in_inventory.size() == 2 && (resource_2_1  == resources_in_inventory[0] || resource_2_1  == resources_in_inventory[1])) || (resources_in_inventory.size() == 3 && (resource_2_1  == resources_in_inventory[0] || resource_2_1  == resources_in_inventory[1] || resource_2_1 == resources_in_inventory[2]))):
		Global.objective_two_item_one_count -= 1
		#Updates objectives in Global.gd
		Events.emit_signal("update_objectives")
		var idx = resources_in_inventory.find(resource_2_1, 0)
		print(str(idx))
		if idx != -1:
			resources_in_inventory.erase(resource_2_1)
			$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	if((resources_in_inventory.size() == 1 && resource_2_2 == resources_in_inventory[0]) || (resources_in_inventory.size() == 2 && (resource_2_2  == resources_in_inventory[0] || resource_2_2  == resources_in_inventory[1])) || (resources_in_inventory.size() == 3 && (resource_2_2  == resources_in_inventory[0] || resource_2_2  == resources_in_inventory[1] || resource_2_2 == resources_in_inventory[2]))):
		Global.objective_two_item_two_count -= 1
		#Updates objectives in Global.gd
		Events.emit_signal("update_objectives")
		var idx = resources_in_inventory.find(resource_2_2, 0)
		print(str(idx))
		if idx != -1:
			resources_in_inventory.erase(resource_2_2)
			$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	if((resources_in_inventory.size() == 1 && resource_2_3 == resources_in_inventory[0]) || (resources_in_inventory.size() == 2 && (resource_2_3  == resources_in_inventory[0] || resource_2_3  == resources_in_inventory[1])) || (resources_in_inventory.size() == 3 && (resource_2_3 == resources_in_inventory[0] || resource_2_3  == resources_in_inventory[1] || resource_2_3 == resources_in_inventory[2]))):
		Global.objective_two_item_three_count -= 1
		#Updates objectives in Global.gd
		Events.emit_signal("update_objectives")
		var idx = resources_in_inventory.find(resource_2_3, 0)
		print(str(idx))
		if idx != -1:
			resources_in_inventory.erase(resource_2_3)
			$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	if(Global.objective_two_item_one_count == 0 && Global.objective_two_item_two_count == 0 && Global.objective_two_item_three_count == 0):
			Global.goto_scene("res://MainGame/GameSpace.tscn")

#may need to add 'resource' into the function			
func sell_first_resource(resource):
	#Tie button to this function
	print("Sell item 1")
	#See what the resource is
	print("Resource 1:" + resource)
	#Check the value of the resource
	var currentItemString = resource + "Value"
	Global.get(currentItemString)
	#Update player's gold
	Global.currency_available += Global.get(currentItemString)
	#Update GUI
	Events.emit_signal("merchant_purchased")
	#Remove from inventory
	var idx = resources_in_inventory.find(resource, 0)
	print(str(idx))
	if idx != -1:
		resources_in_inventory.erase(resource)
		$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	#Refetch global inventory to resize inventory
		#if 2nd becomes 1

		#if 3rd, becomes 2nd 
		###Allowing room here to resize the inventory after selling
	#Refresh inventory to relect how many items are available
	update_global_inventory()

func sell_second_resource(resource):
	var currentItemString = resource + "Value"
	Global.get(currentItemString)
	Global.currency_available += Global.get(currentItemString)
	Events.emit_signal("merchant_purchased")
	var idx = resources_in_inventory.find(resource, 0)
	print(str(idx))
	if idx != -1:
		resources_in_inventory.erase(resource)
		$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	#Refetch global inventory to resize inventory
		#if 3rd comes here
		###Allowing room here to resize the inventory after selling
	update_global_inventory()

func sell_third_resource(resource):
	var currentItemString = resource + "Value"
	Global.get(currentItemString)
	Global.currency_available += Global.get(currentItemString)
	Events.emit_signal("merchant_purchased")
	var idx = resources_in_inventory.find(resource, 0)
	print(str(idx))
	if idx != -1:
		resources_in_inventory.erase(resource)
		$VBoxContainer/HBoxContainer.get_child(idx).texture = base_texture
	#Refetch global inventory to resize inventory
		###Allowing room here to resize the inventory after selling
	update_global_inventory()

func update_global_inventory():
	if(resources_in_inventory.size() == 3):
		Global.current_merchant_inv_three = resources_in_inventory[2]
		Global.current_merchant_inv_two = resources_in_inventory[1]
		Global.current_merchant_inv_one = resources_in_inventory[0]
	elif(resources_in_inventory.size() == 2):
		Global.current_merchant_inv_two = resources_in_inventory[1]
		Global.current_merchant_inv_one = resources_in_inventory[0]
		Global.current_merchant_inv_three = ""
	elif(resources_in_inventory.size() == 1):
		Global.current_merchant_inv_one = resources_in_inventory[0]
		Global.current_merchant_inv_three = ""
		Global.current_merchant_inv_two = ""
	elif(resources_in_inventory.size() == 0):
		Global.current_merchant_inv_three = ""
		Global.current_merchant_inv_two = ""
		Global.current_merchant_inv_one = ""

