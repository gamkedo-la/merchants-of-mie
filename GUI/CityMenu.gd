extends Control

func _ready():
	var con_res
	if not Events.is_connected("merchant_entered_city", self, "_on_merchant_enter_city"):
		con_res = Events.connect("merchant_entered_city", self, "_on_merchant_enter_city")
		assert(con_res == OK)
	if not Events.is_connected("merchant_left_city", self, "_on_merchant_left_city"):
		con_res = Events.connect("merchant_left_city", self, "_on_merchant_left_city")
		assert(con_res == OK)
	
func _on_merchant_enter_city():
	$"Title".text = Global.city_name
	$"VBoxContainer/TextureRect99/SilverValue".text = String(Global.SilverValue * Global.silver_multiplier)
	$"VBoxContainer/TextureRect2/GoldValue".text = String(Global.GoldValue * Global.gold_multiplier)
	$"VBoxContainer/TextureRect3/SaltValue".text = String(Global.SaltValue * Global.salt_multiplier)
	$"VBoxContainer/TextureRect4/GrapesValue".text = String(Global.GrapesValue * Global.grapes_multiplier)
	$"VBoxContainer/TextureRect5/WheatValue".text = String(Global.WheatValue * Global.wheat_multiplier)
	$"VBoxContainer/TextureRect6/TeaValue".text = String(Global.TeaValue * Global.tea_multiplier)
	$"VBoxContainer/TextureRect7/MarbleValue".text = String(Global.MarbleValue * Global.marble_multiplier)
	$"VBoxContainer/TextureRect8/IncenseValue".text = String(Global.IncenseValue * Global.incense_multiplier)
	$"VBoxContainer/TextureRect9/DiamondValue".text = String(Global.DiamondValue * Global.diamond_multiplier)
	$"VBoxContainer/TextureRect10/FishValue".text = String(Global.FishValue * Global.fish_multiplier)
	$"VBoxContainer/TextureRect11/LumberValue".text = String(Global.LumberValue * Global.lumber_multiplier)
	$"VBoxContainer/TextureRect12/DyesValue".text = String(Global.DyesValue * Global.dyes_multiplier)
	$"VBoxContainer/TextureRect13/CoffeeValue".text = String(Global.CoffeeValue * Global.coffee_multiplier)
	
	$"VBoxContainer/TextureRect99/SilverValue2".text = String(Global.SilverBuyValue * Global.silver_multiplier)
	$"VBoxContainer/TextureRect2/GoldValue2".text = String(Global.GoldBuyValue * Global.gold_multiplier)
	$"VBoxContainer/TextureRect3/SaltValue2".text = String(Global.SaltBuyValue * Global.salt_multiplier)
	$"VBoxContainer/TextureRect4/GrapesValue2".text = String(Global.GrapesBuyValue * Global.grapes_multiplier)
	$"VBoxContainer/TextureRect5/WheatValue2".text = String(Global.WheatBuyValue * Global.wheat_multiplier)
	$"VBoxContainer/TextureRect6/TeaValue2".text = String(Global.TeaBuyValue * Global.tea_multiplier)
	$"VBoxContainer/TextureRect7/MarbleValue2".text = String(Global.MarbleBuyValue * Global.marble_multiplier)
	$"VBoxContainer/TextureRect8/IncenseValue2".text = String(Global.IncenseBuyValue * Global.incense_multiplier)
	$"VBoxContainer/TextureRect9/DiamondValue2".text = String(Global.DiamondBuyValue * Global.diamond_multiplier)
	$"VBoxContainer/TextureRect10/FishValue2".text = String(Global.FishBuyValue * Global.fish_multiplier)
	$"VBoxContainer/TextureRect11/LumberValue2".text = String(Global.LumberBuyValue * Global.lumber_multiplier )
	$"VBoxContainer/TextureRect12/DyesValue2".text = String(Global.DyesBuyValue * Global.dyes_multiplier )
	$"VBoxContainer/TextureRect13/CoffeeValue2".text = String(Global.CoffeeBuyValue * Global.coffee_multiplier)
	visible = true
	Events.emit_signal("update_global_inventory_tracking")
	#Update Global values based on city entered

func _on_merchant_left_city():
	visible = false

func _on_Inv1_button_down():
	Events.emit_signal("sell_resource", Global.resources_in_inventory, 0)


func _on_Inv2_button_down():
	Events.emit_signal("sell_resource", Global.resources_in_inventory, 1)


func _on_Inv3_button_down():
	Events.emit_signal("sell_resource", Global.resources_in_inventory, 2)

func _on_Inv4_pressed():
	if(Global.currency_available >= Global.SilverBuyValue):
		Global.item_buy_name = "Silver"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.SilverBuyValue  * Global.silver_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv5_pressed():
	if(Global.currency_available >= Global.GoldBuyValue):
		Global.item_buy_name = "Gold"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.GoldBuyValue * Global.gold_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv6_pressed():
	if(Global.currency_available >= Global.SaltBuyValue):
		Global.item_buy_name = "Salt"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.SaltBuyValue * Global.salt_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv7_pressed():
	if(Global.currency_available >= Global.GrapesBuyValue):
		Global.item_buy_name = "Grapes"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.GrapesBuyValue * Global.grapes_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv8_pressed():
	if(Global.currency_available >= Global.WheatBuyValue):
		Global.item_buy_name = "Wheat"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.WheatBuyValue * Global.wheat_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv9_pressed():
	if(Global.currency_available >= Global.TeaBuyValue):
		Global.item_buy_name = "Tea"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.TeaBuyValue * Global.tea_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv10_pressed():
	if(Global.currency_available >= Global.MarbleBuyValue):
		Global.item_buy_name = "Marble"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.MarbleBuyValue * Global.marble_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv11_pressed():
	if(Global.currency_available >= Global.IncenseBuyValue):
		Global.item_buy_name = "Incense"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.IncenseBuyValue * Global.incense_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv12_pressed():
	if(Global.currency_available >= Global.DiamondBuyValue):
		Global.item_buy_name = "Diamond"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.DiamondBuyValue * Global.diamond_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv13_pressed():
	if(Global.currency_available >= Global.FishBuyValue):
		Global.item_buy_name = "Fish"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.FishBuyValue * Global.fish_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv14_pressed():
	if(Global.currency_available >= Global.LumberBuyValue):
		Global.item_buy_name = "Lumber"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.LumberBuyValue * Global.lumber_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv15_pressed():
	if(Global.currency_available >= Global.DyesBuyValue):
		Global.item_buy_name = "Dyes"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.DyesBuyValue * Global.dyes_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")

func _on_Inv16_pressed():
	if(Global.currency_available >= Global.CoffeeBuyValue):
		Global.item_buy_name = "Coffee"
		Events.emit_signal("buy_inv", Global.item_buy_name)
		Events.emit_signal("resource_picked_up", Global.item_buy_name)
		Global.currency_available -= Global.CoffeeBuyValue * Global.coffee_multiplier
		Events.emit_signal("merchant_purchased")
		Global.item_buy_name = ""
	else:
		print("Either your inventory is full or you have not enough money")
