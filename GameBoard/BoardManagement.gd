extends Node

func _ready():
	var con_res
	if not Events.is_connected("end_player_turn", self, "start_board_turn"):
		con_res = Events.connect("end_player_turn", self, "start_board_turn")
		assert(con_res == OK)
	if not Events.is_connected("end_board_turn", self, "start_player_turn"):
		con_res = Events.connect("end_board_turn", self, "start_player_turn")
		assert(con_res == OK)
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
	
	Events.emit_signal("start_player_turn")


func start_board_turn():
	if Global.turn_number >= (Global.MAX_TURNS - 1):
		Global.goto_scene("res://GameEndScreen/GameEndScreen.tscn")
		return
	
	Events.emit_signal("start_board_turn")
	Global.action_Points_available = Global.action_Points_Per_Turn

