extends Control


var is_paused = false setget set_is_paused

func _ready():
	if not Events.is_connected("game_paused", self, "set_is_paused"):
		var con_res = Events.connect("game_paused", self, "set_is_paused")
		assert(con_res == OK)


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value = true):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_ResumeBtn_pressed():
	print("clicked")
	self.is_paused = false


func _on_QuitBtn_pressed():
	self.is_paused = false
	Global.goto_scene("res://StartScreen/StartScreen.tscn")


func _on_SettingsBtn_pressed():
	SettingsManager.initialize_settings($VBoxContainer/SettingsBtn, false);
	
