extends Spatial

onready var token = $Token
onready var destination = $Position3D

onready var merchant_token = [$Token/merchant, $Token/merchantToken]

var new_transform = Vector3(2,0,0)

var button_pressed = false

func _ready():
	randomize()
	merchant_token.shuffle()
	merchant_token[1].visible = false

func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_C:
		if button_pressed == false:
			token.translation = destination.global_transform.origin
			destination.translation += new_transform
			button_pressed = true
	else:
		button_pressed = false	
		
