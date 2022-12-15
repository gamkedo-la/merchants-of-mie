extends Control

const CASTLE_POSITION = Vector3(-0.502,0,0.461)

func _ready():
	Events.connect("merchant_clicked_castle", self, "_on_merchant_clicked_castle")

func _on_merchant_clicked_castle():
	visible = true


func _on_CancelBtn_pressed():
	visible = false


func _on_MoveBtn_pressed():
	visible = false
	get_tree().call_group("player", "move_to", CASTLE_POSITION)



func _on_BuyBtn_pressed():
	if Global.currency_available >= 20:
		Global.currency_available -= 20
		Events.emit_signal("merchant_purchased")
