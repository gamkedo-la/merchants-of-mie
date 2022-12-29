extends Control

func _ready():
	Events.connect("merchant_entered_city", self, "_on_merchant_enter_city")
	Events.connect("merchant_left_city", self, "_on_merchant_left_city")

func _on_merchant_enter_city():
	$"Title".text = Global.city_name
	#$"VBoxContainer/TextureRect/SilverValue".text = String(Global.SilverValue)
	$"VBoxContainer/TextureRect2/GoldValue".text = String(Global.GoldValue)
	$"VBoxContainer/TextureRect3/SaltValue".text = String(Global.SaltValue)
	$"VBoxContainer/TextureRect4/GrapesValue".text = String(Global.GrapesValue)
	$"VBoxContainer/TextureRect5/WheatValue".text = String(Global.WheatValue)
	$"VBoxContainer/TextureRect6/TeaValue".text = String(Global.TeaValue)
	$"VBoxContainer/TextureRect7/MarbleValue".text = String(Global.MarbleValue)
	$"VBoxContainer/TextureRect8/IncenseValue".text = String(Global.IncenseValue)
	$"VBoxContainer/TextureRect9/DiamondValue".text = String(Global.DiamondValue)
	$"VBoxContainer/TextureRect10/FishValue".text = String(Global.FishValue)
	#$"VBoxContainer/TextureRect11/LumberValue".text = String(Global.LumberValue )
	#$"VBoxContainer/TextureRect12/DyesValue".text = String(Global.DyesValue )
	$"VBoxContainer/TextureRect13/CoffeeValue".text = String(Global.CoffeeValue)
	visible = true
	#Update Global values based on city entered

func _on_merchant_left_city():
	visible = false
