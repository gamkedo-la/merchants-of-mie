extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("start_player_turn", self, "start_player_turn")
	Events.connect("start_board_turn", self, "start_board_turn")


func start_player_turn():
	$Label.text = "PLAYER TURN"
	$AnimationPlayer.play("BoardTurn")
	pass
	
func start_board_turn():
	$Label.text = "BOARD TURN"
	$AnimationPlayer.play("BoardTurn")
	pass
