extends BaseAction

var position = Vector2()
var resource
var resource_path
var resource_parent

func _init():
	# todo: make one sound for each of
	# coffee diamond fish gold grapes incense marble salt tea wheat dye lumber 
	sfx = load("Audio/SFX/PickupResource.wav")

func execute():
	print("execute resource pickup")
	resource.queue_free()
	Global.total_resources_on_board -= 1
	# we should play pickup sounds here

func undo():
	print("undo resource pickup")
	var scene = load(resource_path)
	var resource = scene.instance()
	resource_parent.add_child(resource)
	Events.emit_signal("resource_dropped", resource.resource_name)
	Global.total_resources_on_board += 1
