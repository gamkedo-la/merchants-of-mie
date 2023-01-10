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
	$"VBoxContainer/TextureRect11/LumberValue".text = String(Global.LumberValue )
	$"VBoxContainer/TextureRect12/DyesValue".text = String(Global.DyesValue )
	$"VBoxContainer/TextureRect13/CoffeeValue".text = String(Global.CoffeeValue)
	
	#$"VBoxContainer/TextureRect/SilverValue".text = String(Global.SilverValue)
	$"VBoxContainer/TextureRect2/GoldValue2".text = String(Global.GoldBuyValue)
	$"VBoxContainer/TextureRect3/SaltValue2".text = String(Global.SaltBuyValue)
	$"VBoxContainer/TextureRect4/GrapesValue2".text = String(Global.GrapesBuyValue)
	$"VBoxContainer/TextureRect5/WheatValue2".text = String(Global.WheatBuyValue)
	$"VBoxContainer/TextureRect6/TeaValue2".text = String(Global.TeaBuyValue)
	$"VBoxContainer/TextureRect7/MarbleValue2".text = String(Global.MarbleBuyValue)
	$"VBoxContainer/TextureRect8/IncenseValue2".text = String(Global.IncenseBuyValue)
	$"VBoxContainer/TextureRect9/DiamondValue2".text = String(Global.DiamondBuyValue)
	$"VBoxContainer/TextureRect10/FishValue2".text = String(Global.FishBuyValue)
	$"VBoxContainer/TextureRect11/LumberValue2".text = String(Global.LumberBuyValue )
	$"VBoxContainer/TextureRect12/DyesValue2".text = String(Global.DyesBuyValue )
	$"VBoxContainer/TextureRect13/CoffeeValue2".text = String(Global.CoffeeBuyValue)
	visible = true
	Events.emit_signal("update_global_inventory_tracking")
	#Update Global values based on city entered

func _on_merchant_left_city():
	visible = false

func _on_Inv1_button_down():
	Events.emit_signal("sell_inv_one", Global.current_merchant_inv_one)


func _on_Inv2_button_down():
	Events.emit_signal("sell_inv_two", Global.current_merchant_inv_two)


func _on_Inv3_button_down():
	Events.emit_signal("sell_inv_three", Global.current_merchant_inv_three)
