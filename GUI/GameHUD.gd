extends Control

signal undo_actions

# Called when the node enters the scene tree for the first time.
func _ready():
	update_GUI()
	if not Events.is_connected("update_UI", self, "update_GUI"):
		var con_res = Events.connect("update_UI", self, "update_GUI")
		assert(con_res == OK)
	pass # Replace with function body.

func _on_EndTurnBtn_pressed():
	Events.emit_signal("end_player_turn")

func _on_Undo_pressed():
	Events.emit_signal("undo_actions")

func update_GUI():
	$"Objectives/VBoxContainer/Objective Text".text = Global.objective_one_text_concatenate
	$"Objectives/VBoxContainer2/Objective Text2-1".text = Global.objective_two_one_text_concatenate
	$"Objectives/VBoxContainer2/Objective Text2-2".text = Global.objective_two_two_text_concatenate
	$"Objectives/VBoxContainer2/Objective Text2-3".text = Global.objective_two_three_text_concatenate
	if(Global.first_objective_completed):
		$Objectives/SecondObjCover.visible = false
		$"Objectives/VBoxContainer/Objective Text".text = "1st Objective Complete!"
	if(Global.objective_two_item_one_count <= 0):
		$"Objectives/VBoxContainer2/Objective Text2-1".text = "Item 1 done!"
	if(Global.objective_two_item_two_count <= 0):
		$"Objectives/VBoxContainer2/Objective Text2-2".text = "Item 2 done!"
	if(Global.objective_two_item_three_count <= 0):
		$"Objectives/VBoxContainer2/Objective Text2-3".text = "Item 3 done!"

func _on_PauseButton_pressed():
	Events.emit_signal("game_paused")

