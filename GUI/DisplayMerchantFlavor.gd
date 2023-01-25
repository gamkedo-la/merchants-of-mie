extends Control

func _ready():
	if not Events.is_connected("update_merchant_flavor_text", self, "_updateFlavorText"):
		var con_res = Events.connect("update_merchant_flavor_text", self, "_updateFlavorText")
		assert(con_res == OK)

func _updateFlavorText():
	$Title.text = Global.merchant_name
	$Flavor.text = Global.merchant_flavor_text
