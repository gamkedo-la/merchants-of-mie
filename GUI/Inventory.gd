extends Control

var resources_in_inventory = []
var coffee_texture = preload("res://SharedResources/ResourceIcons/Coffee.png")
var fish_texture = preload("res://SharedResources/ResourceIcons/Fish.png")
var gold_texture = preload("res://SharedResources/ResourceIcons/Gold.png")
var grapes_texture = preload("res://SharedResources/ResourceIcons/Grapes.png")
var incense_texture = preload("res://SharedResources/ResourceIcons/Incense.png")
var salt_texture = preload("res://SharedResources/ResourceIcons/Salt.png")
var wheat_texture = preload("res://SharedResources/ResourceIcons/Wheat.png")

func _ready():
	Events.connect("resource_picked_up", self, "add_resource_to_inventory")
	


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
