extends Spatial

export var move_speed = 50
export var moving = false

var destination_position = $DestinationTarget.global_transform

func go_there(delta):
	if moving:
		$merchantToken.global_transform = $merchantToken.global_transform.move_toward(destination_position, delta * move_speed)
	if $merchantToken.global_transform == destination_position:
		moving = false
		
func _process(delta):
	go_there(delta)
	
	if Input.is_action_just_pressed("goto_destination"):
		moving = true
