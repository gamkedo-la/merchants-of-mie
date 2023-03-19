extends Control

func _ready():
	if SettingsManager.soundtrack_enabled():
		#SettingsManager.stop_mainsoundtrack();
		SettingsManager.play_endgame_sound();
	if(Global.objective_two_item_one_count <= 0 && Global.objective_two_item_two_count <= 0 && Global.objective_two_item_three_count <= 0):
		get_node("WinningCutScene").visible = true
		$AnimationPlayer.play("WinningCamera")
	else:
		get_node("LosingCutScene").visible = true
		$AnimationPlayer.play("LosingCamera")
	
	Global.turn_number = 0
	yield(get_tree().create_timer(7), "timeout")
	if(Global.objective_two_item_one_count == 0 && Global.objective_two_item_two_count == 0 && Global.objective_two_item_three_count == 0):
		get_node("CenterContainer").visible = true
	else:
		get_node("LosingContainer").visible = true

func _on_ReplayBtn_pressed():
	Global.goto_scene("res://MainGame/GameSpace.tscn")
	if SettingsManager.soundtrack_enabled():
		SettingsManager.play_mainsoundtrack();


func _on_ExitToMainBtn_pressed():
	Global.goto_scene("res://StartScreen/StartScreen.tscn")
	if SettingsManager.soundtrack_enabled():
		SettingsManager.play_mainsoundtrack();

