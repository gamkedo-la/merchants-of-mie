extends Control

const TurnsRemaining = preload("res://Global.gd")

func _ready():
	get_node("CardCount").text = str(TurnsRemaining.MAX_TURNS)

func update_Card_Count_UI():
	get_node("CardCount").text = str(TurnsRemaining.MAX_TURNS - TurnsRemaining.turn_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
