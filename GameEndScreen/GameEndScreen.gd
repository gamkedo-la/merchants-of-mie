extends Control

var winning_sound = preload("res://Audio/SFX/Celebration.wav")
var losing_sound = preload("res://Audio/SFX/Failure.wav")

var hasPlayed = false

func _ready():
	if(Global.objective_two_item_one_count == 0 && Global.objective_two_item_two_count == 0 && Global.objective_two_item_three_count == 0):
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


func _on_ExitToMainBtn_pressed():
	Global.goto_scene("res://StartScreen/StartScreen.tscn")

func _process(delta: float) -> void:
	if(Global.objective_two_item_one_count == 0 && Global.objective_two_item_two_count == 0 && Global.objective_two_item_three_count == 0):
		if !$AudioStreamPlayer.is_playing() && !hasPlayed:
			$AudioStreamPlayer.stream = winning_sound
			$AudioStreamPlayer.play()
			hasPlayed = true
	else:
		if !$AudioStreamPlayer.is_playing() && !hasPlayed:
			$AudioStreamPlayer.stream = losing_sound
			$AudioStreamPlayer.play()
			hasPlayed = true
