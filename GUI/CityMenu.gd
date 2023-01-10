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

func _on_Inv4_pressed():
	print("Placeholder until silver done")
	#if(Global.currency_available >= Global.SilverBuyValue):
		#Global.item_buy_name = "Silver"
		#Events.emit_signal("buy_inv", Global.item_buy_name)
		#print("Add resource to open inv")
		#Global.currency_available -= Global.SilverBuyValue
		#Global.item_buy_name = ""

func _on_Inv5_pressed():
	if(Global.currency_available >= Global.GoldBuyValue):
		Global.item_buy_name = "Gold"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.GoldBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv6_pressed():
	if(Global.currency_available >= Global.SaltBuyValue):
		Global.item_buy_name = "Salt"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.SaltBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv7_pressed():
	if(Global.currency_available >= Global.GrapesBuyValue):
		Global.item_buy_name = "Grapes"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.GrapesBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv8_pressed():
	if(Global.currency_available >= Global.WheatBuyValue):
		Global.item_buy_name = "Wheat"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.WheatBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv9_pressed():
	if(Global.currency_available >= Global.TeaBuyValue):
		Global.item_buy_name = "Tea"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.TeaBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv10_pressed():
	if(Global.currency_available >= Global.MarbleBuyValue):
		Global.item_buy_name = "Marble"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.MarbleBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv11_pressed():
	if(Global.currency_available >= Global.IncenceBuyValue):
		Global.item_buy_name = "Incence"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.IncenceBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv12_pressed():
	if(Global.currency_available >= Global.DiamondBuyValue):
		Global.item_buy_name = "Diamond"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.DiamondBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv13_pressed():
	if(Global.currency_available >= Global.FishBuyValue):
		Global.item_buy_name = "Fish"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.FishBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv14_pressed():
	if(Global.currency_available >= Global.LumberBuyValue):
		Global.item_buy_name = "Lumber"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.LumberBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv15_pressed():
	if(Global.currency_available >= Global.DyesBuyValue):
		Global.item_buy_name = "Dyes"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.DyesBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv16_pressed():
	if(Global.currency_available >= Global.CoffeeBuyValue):
		Global.item_buy_name = "Coffee"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.CoffeeBuyValue
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")
