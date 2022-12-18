extends Control

func _ready():
	Global.turn_number = 0
	yield(get_tree().create_timer(8), "timeout")
	for _i in self.get_children():
		_i.is_visible_in_tree(true)

func _on_ReplayBtn_pressed():
	Global.goto_scene("res://MainGame/GameSpace.tscn")


func _on_ExitToMainBtn_pressed():
	Global.goto_scene("res://StartScreen/StartScreen.tscn")
