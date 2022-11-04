extends Node

signal end_turn

func _ready():
	Events.connect("start_board_turn", self, "start_board_turn")

func start_board_turn():
	#this is where we would put all of the board's actions
	print("currently, it is the board's turn")
	yield(get_tree().create_timer(3), "timeout")
	Events.emit_signal("end_board_turn")
