extends BaseAction

var position = Vector2()
var resource
var resource_path
var resource_parent

func execute():
	print("execute resource pickup")
	resource.queue_free()
	Global.total_resources_on_board -= 1

func undo():
	print("undo resource pickup")
	var scene = load(resource_path)
	var resource = scene.instance()
	resource_parent.add_child(resource)
	Events.emit_signal("resource_dropped", resource.resource_name)
	Global.total_resources_on_board += 1
