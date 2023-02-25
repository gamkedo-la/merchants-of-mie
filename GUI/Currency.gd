extends Control


func _ready():
	if not Events.is_connected("merchant_purchased", self, "merchant_purchased"):
		var con_res = Events.connect("merchant_purchased", self, "merchant_purchased")
		assert(con_res == OK)
	$CurrencyAmount.text = str(Global.currency_available)


func merchant_purchased():
	$CurrencyAmount.text = str(Global.currency_available)
