extends Control

const CASTLE_POSITION = Vector3(-0.502,0,0.461)

func _ready():
	if not Events.is_connected("merchant_clicked_castle", self, "_on_merchant_clicked_castle"):
		var con_res = Events.connect("merchant_clicked_castle", self, "_on_merchant_clicked_castle")
		assert(con_res == OK)
		

func _on_merchant_clicked_castle():
	visible = true

func _on_CancelBtn_pressed():
	visible = false

func _on_MoveBtn_pressed():
	visible = false
	get_tree().call_group("player", "move_to", CASTLE_POSITION)

func _on_BuyBtn_pressed():
	
	if not Global.currency_available >= 20:
		return
	
	Global.currency_available -= 20
	Events.emit_signal("merchant_purchased")
		
	Global.action_Points_Per_Turn += 6
	Global.action_Points_available += 6
	
	var merchants = get_tree().get_nodes_in_group("player")
	
	for x in merchants:
		if x.visible == false:
			x.visible = true
			x.purchased_merchant = true
			visible = false
			return
