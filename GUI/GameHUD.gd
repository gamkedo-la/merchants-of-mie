extends Control

signal undo_actions

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EndTurnBtn_pressed():
	Events.emit_signal("end_player_turn")

func _on_Undo_pressed():
	Events.emit_signal("undo_actions")
