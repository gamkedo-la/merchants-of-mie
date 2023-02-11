extends BaseAction

var position = Vector2()
var resource
var resource_path
var resource_parent

func _init():
	# todo: make one sound for each of
	# coffee diamond fish gold grapes incense marble salt tea wheat dye lumber 
	if(Global.item_picked_up_name == "Coffee"):
		sfx = load("Audio/SFX/coffee-tumbling-in-container.mp3")
	elif(Global.item_picked_up_name == "Diamond"):
		sfx = load("Audio/SFX/diamond-dinging.mp3")
	elif(Global.item_picked_up_name == "Fish"):
		sfx = load("Audio/SFX/PickupFish.wav")
	elif(Global.item_picked_up_name == "Gold"):
		sfx = load("Audio/SFX/PickupGold.wav")
	elif(Global.item_picked_up_name == "Grapes"):
		sfx = load("Audio/SFX/PickupGrapes.wav")
	elif(Global.item_picked_up_name == "Incense"):
		sfx = load("Audio/SFX/PickupIncense.wav")
	elif(Global.item_picked_up_name == "Marble"):
		sfx = load("Audio/SFX/PickupMarble.wav")
	elif(Global.item_picked_up_name == "Salt"):
		sfx = load("Audio/SFX/PickupSalt.wav")
	elif(Global.item_picked_up_name == "Tea"):
		sfx = load("Audio/SFX/PickupTea.wav")
	elif(Global.item_picked_up_name == "Wheat"):
		sfx = load("Audio/SFX/PickupWheat.wav")
	elif(Global.item_picked_up_name == "Dye"):
		sfx = load("Audio/SFX/PickupDye.wav")
	elif(Global.item_picked_up_name == "Lumber"):
		sfx = load("Audio/SFX/PickupLumber.wav")
	elif(Global.item_picked_up_name == "Silver"):
		sfx = load("Audio/SFX/coins-rustling1.mp3")
	else:
		sfx = load("Audio/SFX/PickupResource.wav")
	Global.item_picked_up_name == ""
	
func execute():
	print("execute resource pickup")
	resource.queue_free()
	Global.total_resources_on_board -= 1
	# we should play pickup sounds here

func undo():
	print("undo resource pickup")
	var scene = load(resource_path)
	resource = scene.instance()
	resource_parent.add_child(resource)
	Events.emit_signal("resource_dropped", resource.resource_name)
	Global.total_resources_on_board += 1
