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

func _ready():
	Events.connect("resource_picked_up", self, "add_resource_to_inventory")
	Events.connect("resource_dropped", self, "remove_resource_from_inventory")


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
	
	if resource in resources_in_inventory:
		print("You already have this resource in your inventory")
		return
	
	if resources_in_inventory.size() < 3:
		resources_in_inventory.append(resource)
		$VBoxContainer/HBoxContainer.get_child(resources_in_inventory.size()-1).texture = inventory_texture
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
