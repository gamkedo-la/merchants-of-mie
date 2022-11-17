extends Control

var resources_in_inventory = []

func _ready():
	Events.connect("resource_picked_up", self, "add_resource_to_inventory")


func add_resource_to_inventory(resource):
	if resources_in_inventory.size() < 3:
		resources_in_inventory.append(resource)
	
	print(resources_in_inventory)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
