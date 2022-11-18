extends Camera

const RAY_LENGTH = 1000

var min_zoom = 4
var max_zoom = 12.5

var current_zoom = 7.5
var rate_to_zoom = .5

var move_camera_left = 50
var move_camera_right = 970
var move_camera_up = 40
var move_camera_down = 560

var cam_move_rate = .1
var direction = Vector3(0,0,0)

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

func _physics_process(delta):
	var pos = get_viewport().get_mouse_position()
	
	if(pos.x < move_camera_left):
		direction.x = -cam_move_rate
	elif(pos.x > move_camera_right):
		direction.x = cam_move_rate
	elif(pos.y < move_camera_up):
		direction.y = cam_move_rate
	elif(pos.y > move_camera_down):
		direction.y = -cam_move_rate
	else:
		direction.x = 0
		direction.y = 0
		
	if(global_transform.origin.x > 14):
		global_transform.origin.x = 14
	if(global_transform.origin.x < 10):
		global_transform.origin.x = 10
	if(global_transform.origin.y > 12):
		global_transform.origin.y = 12
	if(global_transform.origin.y < 5):
		global_transform.origin.y = 5
	
	translate_object_local(direction)
