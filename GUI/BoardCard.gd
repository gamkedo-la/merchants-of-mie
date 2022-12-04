extends Control

func _ready():
	Events.connect("start_board_turn", self, "spawnCard")

func spawnCard():
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("CardSpinReveal")
	get_node("FlavorText").text = Global.flavor_text
	#$"BoardCard/FlavorText".text = str("Global.flavor_text")
	get_node("FunctionalText").text = Global.functional_text
	#$"BoardCard/FunctionalText".text = str("Global.functional_text")
	#pass


func _on_Button_pressed():
	print("Advance Turn")
	Events.emit_signal("end_board_turn")
	Global.action_Points_available = Global.action_Points_Per_Turn
	
	print("Turn Board Card off")
	$AnimationPlayer.play("CardSpinBase")
	pass # Replace with function body.
