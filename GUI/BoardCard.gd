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
	if(Global.silver_modifier_changed):
		Global.silver_turn_countdown -= 1
		if(Global.silver_turn_countdown <= 0):
			Global.silver_multiplier = 1
			Global.silver_modifier_changed = false
	if(Global.gold_modifier_changed):
		Global.gold_turn_countdown -= 1
		if(Global.gold_turn_countdown <= 0):
			Global.gold_multiplier = 1
			Global.gold_modifier_changed = false
	if(Global.salt_modifier_changed):
		Global.salt_turn_countdown -= 1
		if(Global.salt_turn_countdown <= 0):
			Global.salt_multiplier = 1
			Global.salt_modifier_changed = false
	if(Global.grapes_modifier_changed):
		Global.grapes_turn_countdown -= 1
		if(Global.grapes_turn_countdown <= 0):
			Global.grapes_multiplier = 1
			Global.grapes_modifier_changed = false
	if(Global.wheat_modifier_changed):
		Global.wheat_turn_countdown -= 1
		if(Global.wheat_turn_countdown <= 0):
			Global.wheat_multiplier = 1
			Global.wheat_modifier_changed = false
	if(Global.tea_modifier_changed):
		Global.tea_turn_countdown -= 1
		if(Global.tea_turn_countdown <= 0):
			Global.tea_multiplier = 1
			Global.tea_modifier_changed = false
	if(Global.marble_modifier_changed):
		Global.marble_turn_countdown -= 1
		if(Global.marble_turn_countdown <= 0):
			Global.marble_multiplier = 1
			Global.marble_modifier_changed = false
	if(Global.incense_modifier_changed):
		Global.incense_turn_countdown -= 1
		if(Global.incense_turn_countdown <= 0):
			Global.incense_multiplier = 1
			Global.incense_modifier_changed = false
	if(Global.diamonds_modifier_changed):
		Global.diamonds_turn_countdown -= 1
		if(Global.diamonds_turn_countdown <= 0):
			Global.diamond_multiplier = 1
			Global.diamonds_modifier_changed = false
	if(Global.fish_modifier_changed):
		Global.fish_turn_countdown -= 1
		if(Global.fish_turn_countdown <= 0):
			Global.fish_multiplier = 1
			Global.fish_modifier_changed = false
	if(Global.lumber_modifier_changed):
		Global.lumber_turn_countdown -= 1
		if(Global.lumber_turn_countdown <= 0):
			Global.lumber_multiplier = 1
			Global.lumber_modifier_changed = false
	if(Global.dyes_modifier_changed):
		Global.dyes_turn_countdown -= 1
		if(Global.dyes_turn_countdown <= 0):
			Global.dyes_multiplier = 1
			Global.dyes_modifier_changed = false
	if(Global.coffee_modifier_changed):
		Global.coffee_turn_countdown -= 1
		if(Global.coffee_turn_countdown <= 0):
			Global.coffee_multiplier = 1
			Global.coffee_modifier_changed = false
	pass # Replace with function body.
