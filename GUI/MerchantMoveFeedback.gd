extends Control

func _ready():
	Events.connect("tile_hovered", self, "_on_tile_hovered_")

func _on_tile_hovered_():
	visible = true

func _on_CancelBtn_pressed():
	visible = false

func _on_MoveBtn_pressed():
	visible = false
	# TODO - Get movement position
	var requested_move_position = Vector3(0,0,0)
	get_tree().call_group("player", "move_to", requested_move_position)
