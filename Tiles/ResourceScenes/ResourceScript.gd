extends Spatial

export var resource_name = "Coffee"
var action_queue
var PickUpAction = load("Actions/ResourcePickupAction.gd")
var time = 0
var active = false

func _ready():
	action_queue = get_node("/root/GameSpace/ActionQueue")

func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area" && active):
		var pickup = PickUpAction.new()
		pickup.position = area.global_transform
		pickup.resource = self
		pickup.resource_parent = get_parent()
		pickup.resource_path = self.filename
		print("Merchant Picked Up: " + resource_name)
		action_queue.execute(pickup)
		
		Events.emit_signal("resource_picked_up", resource_name)
		#queue_free()
		# Replace with function body.

func _process(delta):
	if(!active):
		time += delta
	
	if(!active && time > 1):
		active = true
