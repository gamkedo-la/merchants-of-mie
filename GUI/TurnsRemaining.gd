extends Control

func _ready():
	Events.connect("start_player_turn", self, "update_card_count_ui")
	get_node("CardCount").text = str(Global.MAX_TURNS)

func update_card_count_ui():
	print( str(Global.MAX_TURNS - Global.turn_number) + " for turn Count")
	get_node("CardCount").text = str(Global.MAX_TURNS - Global.turn_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
