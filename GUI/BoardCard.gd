extends Control

func _ready():
	Events.connect("start_board_turn", self, "spawnCard")

func spawnCard():
	$AnimationPlayer.play("CardSpinReveal")
	yield(get_tree().create_timer(3), "timeout")
	get_node("FlavorText").text = Global.flavor_text
	#$"BoardCard/FlavorText".text = str("Global.flavor_text")
	get_node("FunctionalText").text = Global.functional_text
	#$"BoardCard/FunctionalText".text = str("Global.functional_text")
	#pass
