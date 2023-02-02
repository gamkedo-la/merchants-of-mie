extends Control

func _ready():
	if not Events.is_connected("start_player_turn", self, "update_card_count_ui"):
		var con_res = Events.connect("start_player_turn", self, "update_card_count_ui")
		assert(con_res == OK)
	get_node("CardCount").text = str(Global.MAX_TURNS)

func update_card_count_ui():
	if((Global.MAX_TURNS - Global.turn_number) <= 1):
		get_node("CardCount").text = str("")
		get_node("Label").text = str("Last Turn!")
	else:	
		print( str(Global.MAX_TURNS - Global.turn_number) + " for turn Count")
		get_node("CardCount").text = str(Global.MAX_TURNS - Global.turn_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
