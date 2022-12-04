extends Control

signal undo_actions

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Objectives/VBoxContainer/Objective Text".text = Global.objective_one_text
	$"Objectives/VBoxContainer2/Objective Text2-1".text = Global.objective_two_one_text
	$"Objectives/VBoxContainer2/Objective Text2-2".text = Global.objective_two_two_text
	$"Objectives/VBoxContainer2/Objective Text2-3".text = Global.objective_two_three_text
	pass # Replace with function body.

func _on_EndTurnBtn_pressed():
	Events.emit_signal("end_player_turn")

func _on_Undo_pressed():
	Events.emit_signal("undo_actions")
