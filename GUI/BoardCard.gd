extends Control

func _ready():
	if not Events.is_connected("start_board_turn", self, "spawnCard"):
		var con_res = Events.connect("start_board_turn", self, "spawnCard")
		assert(con_res == OK)

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
	if(Global.west_rymare_lockdown):
		Global.west_rymare_countdown -= 1
		if(Global.west_rymare_countdown <= 0):
			Global.west_rymare_lockdown = false
			Events.emit_signal("turn_on_west_rymare")
	if(Global.doveshire_lockdown):
		Global.doveshire_countdown -= 1
		if(Global.doveshire_countdown <= 0):
			Global.doveshire_lockdown = false
			Events.emit_signal("turn_on_doveshire")
	if(Global.vine_river_lockdown):
		Global.vine_river_countdown -= 1
		if(Global.vine_river_countdown <= 0):
			Global.vine_river_lockdown = false
			Events.emit_signal("turn_on_vine_river")
	if(Global.easthaven_lockdown):
		Global.easthaven_countdown -= 1
		if(Global.easthaven_countdown <= 0):
			Global.easthaven_lockdown = false
			Events.emit_signal("turn_on_easthaven")
	if(Global.greenglade_lockdown):
		Global.greenglade_countdown -= 1
		if(Global.greenglade_countdown <= 0):
			Global.greenglade_lockdown = false
			Events.emit_signal("turn_on_greenglade")
	if(Global.dro_hills_lockdown):
		Global.dro_hills_countdown -= 1
		if(Global.dro_hills_countdown <= 0):
			Global.dro_hills_lockdown = false
			Events.emit_signal("turn_on_dro_hills")
	pass # Replace with function body.
