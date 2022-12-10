extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("merchant_clicked_castle", self, "_on_merchant_entered_castle")

func _on_merchant_entered_castle():
	visible = true


func _on_CancelBtn_pressed():
	visible = false
