extends Node

#signal out_of_trader_movement_points
signal end_turn


func _ready():
	Events.connect("start_player_turn", self, "start_player_turn")

func start_player_turn():
	# Wait for feedback animation to finish
	yield(get_tree().create_timer(3), "timeout")
	
	print("Currently, it is the player's turn")
	#yield(player, "out_of_trader_movement_points")
		#The above 'yield' will hold the game at this state until we hit a certain trigger. 
		#We can stash anything we want in here, then we could have the turn advance with a signal or a button press
	#yield(get_tree().create_timer(0.5), "timeout")
	#Events.emit_signal("end_player_turn")
