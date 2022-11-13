extends Node

export var city_Name = "CITY_NAME"
export var resource_value_silver = 3
export var resource_value_gold = 3
export var resource_value_salt = 3
export var resource_value_grapes = 3
export var resource_value_wheat = 3
export var resource_value_tea = 3
export var resource_value_marble = 3
export var resource_value_incense = 3
export var resource_value_diamonds = 3
export var resource_value_fish = 3
export var resource_value_lumber = 3
export var resource_value_dyes = 3
export var resource_value_coffee = 3

signal end_turn

func _ready():
	Events.connect("start_board_turn", self, "start_board_turn")

func start_board_turn():
	#this is where we would put all of the board's actions
	print("currently, it is the board's turn")
	yield(get_tree().create_timer(3), "timeout")
	Events.emit_signal("end_board_turn")
