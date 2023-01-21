extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera/CameraAnimation.play("starting_anim")
	pass
		
	
func _on_NewGameButton_pressed():
	Global.goto_scene("res://MainGame/GameSpace.tscn")
	
func _on_ExitButton_pressed():
	get_tree().quit()

func _on_SettingsButton_pressed():
	SettingsManager.initialize_settings($CenterContainer/VBoxContainer/SettingsButton);
	
