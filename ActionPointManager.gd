extends Node

onready var action_Points_available = 5
onready var action_Points_Per_Turn = 5 

func _ready():
	print("At turn start, player has: " + str(action_Points_Per_Turn) + " available")
