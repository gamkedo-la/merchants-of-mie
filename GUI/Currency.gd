extends Control


func _ready():
	Events.connect("merchant_purchased", self, "merchant_purchased")
	$VBoxContainer/CurrencyAmount.text = str(Global.currency_available)


func merchant_purchased():
	$VBoxContainer/CurrencyAmount.text = str(Global.currency_available)
