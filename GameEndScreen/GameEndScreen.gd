extends Control

func _ready():
	Global.turn_number = 0

func _on_ReplayBtn_pressed():
	Global.goto_scene("res://MainGame/GameSpace.tscn")


func _on_ExitToMainBtn_pressed():
	Global.goto_scene("res://StartScreen/StartScreen.tscn")
