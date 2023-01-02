extends Control

func _ready():
	Events.connect("update_merchant_flavor_text", self, "_updateFlavorText")

func _updateFlavorText():
	$Title.text = Global.merchant_name
	$Flavor.text = Global.merchant_flavor_text
