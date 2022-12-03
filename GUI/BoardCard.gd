extends Control


# Called when the node enters the scene tree for the first time.

func _ready():
	$AnimationPlayer.play("CardSpinReveal")
	#$"BoardCard/FlavorText".text = str("Global.flavor_text")
	#$"BoardCard/FunctionalText".text = str("Global.functional_text")
	#pass
