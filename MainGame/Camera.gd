extends Camera

const RAY_LENGTH = 1000


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var from = project_ray_origin(event.position)
		print(from)
		var to = from + project_ray_normal(event.position) * RAY_LENGTH
		var space_state = get_world().direct_space_state
		var result = space_state.intersect_ray(from, to, [], 1)
		if result:
			print("clicked")
			get_tree().call_group("player", "move_to", result.position)
