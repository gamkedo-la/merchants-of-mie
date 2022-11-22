extends Node

func _ready():
	Events.connect("end_player_turn", self, "start_board_turn")
	Events.connect("end_board_turn", self, "start_player_turn")
	
	start_player_turn()
	

#Currently - _ready() starts the turn with the player
#start_player_turn is the Player's turn. We wait .4 seconds, then we end the turn. 
#We hit start_board_turn
#The board references "BoardActions.gd" and waits .4 seconds, then it ends the board's turn. 
#The board then passes the turn back to the player

func start_player_turn():
	Global.turn_number += 1
	Global.action_Points_available = Global.action_Points_Per_Turn
	#if game is over
	if Global.turn_number >= Global.MAX_TURNS:
		Global.goto_scene("res://GameEndScreen/GameEndScreen.tscn")
		return
	
	Events.emit_signal("start_player_turn")


func start_board_turn():
	Events.emit_signal("start_board_turn")
	Global.action_Points_available = Global.action_Points_Per_Turn

