extends Camera

const RAY_LENGTH = 1000

var min_zoom = 4
var max_zoom = 12.5

var current_zoom = 7.5
var rate_to_zoom = .5

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1:
			var from = project_ray_origin(event.position)
			print(from)
			var to = from + project_ray_normal(event.position) * RAY_LENGTH
			var space_state = get_world().direct_space_state
			var result = space_state.intersect_ray(from, to, [], 1)
			if result:
				print("clicked")
				get_tree().call_group("player", "move_to", result.position)
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				current_zoom -= rate_to_zoom
				size = current_zoom
				if current_zoom < min_zoom:
					current_zoom = min_zoom
				print(current_zoom)
				
			if event.button_index == BUTTON_WHEEL_DOWN:
				current_zoom += rate_to_zoom
				size = current_zoom
				if current_zoom > max_zoom:
					current_zoom = max_zoom
				print(current_zoom)

func _on_Top_mouse_entered():
	print("move up")
	


func _on_Top_mouse_exited():
	print("stop")
