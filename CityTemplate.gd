extends Spatial

export var city_name = "West Rymare"



enum town_resource_status {
	HAVE_EXCESS,
	HAVE_ENOUGH,
	NEUTRAL,
	NEED_RESOURCE,
	NEED_ALOT
}


#Resource Values 

#Array, 0 = not current state, 1 = current state
#Array Placement = 0: 'Have Too Much' = -80% value + Rounded = 1
#Array Placement = 1:'Have Enough' = -40% + Rounded = 3
#Array Placement = 2:'Neutral' = 0% + Rounded = 5
#Array Placement = 3:'Need Resource' = +40% + Rounded = 7
#Array Placement = 4:'Desperately Need' = +80% + Rounded = 9
export var base_resource_value = 5
var scarcity_price_modifier = 2

var have_excess = -.8
var have_enough = -.4
var neutral = 0
var need_resource = .4
var need_alot = .8

var resource_value_modifiers = [have_excess, have_enough, neutral, need_resource, need_alot];

var have_excess_buy = -.8
var have_enough_buy = -.4
var neutral_buy = 0
var need_resource_buy = .4
var need_alot_buy = .8

export var resource_status_silver = [0,0,0,0,0]
export var resource_status_gold = [0,0,0,0,0]
export var resource_status_salt = [0,0,0,0,0]
export var resource_status_grapes = [0,0,0,0,0]
export var resource_status_wheat = [0,0,0,0,0]
export var resource_status_tea = [0,0,0,0,0]
export var resource_status_marble = [0,0,0,0,0]
export var resource_status_incense = [0,0,0,0,0]
export var resource_status_diamond = [0,0,0,0,0]
export var resource_status_fish = [0,0,0,0,0]
export var resource_status_lumber = [0,0,0,0,0]
export var resource_status_dyes = [0,0,0,0,0]
export var resource_status_coffee = [0,0,0,0,0]

var resource_statuses = [
	resource_status_silver,
	resource_status_gold,
	resource_status_salt,
	resource_status_grapes,
	resource_status_wheat,
	resource_status_tea,
	resource_status_marble,
	resource_status_incense,
	resource_status_diamond,
	resource_status_fish,
	resource_status_lumber,
	resource_status_dyes,
	resource_status_coffee,
];

var silver_value = 0
var gold_value = 0
var salt_value = 0
var grapes_value = 0
var wheat_value = 0
var tea_value = 0
var marble_value = 0
var incense_value = 0
var diamond_value = 0
var fish_value = 0
var lumber_value = 0
var dyes_value = 0
var coffee_value = 0

var silver_buy_value = 0
var gold_buy_value = 0
var salt_buy_value = 0
var grapes_buy_value = 0
var wheat_buy_value = 0
var tea_buy_value = 0
var marble_buy_value = 0
var incense_buy_value = 0
var diamond_buy_value = 0
var fish_buy_value = 0
var lumber_buy_value = 0
var dyes_buy_value = 0
var coffee_buy_value = 0

func make_resource_scarce(city_name_receiving_scarcity: String, scarce_resource_name: String):
	if city_name != city_name_receiving_scarcity: return
	for resource in Global.resource_names:
		if (resource == scarce_resource_name):
			var resource_index = Global.resource_names.find(resource)
			var targeted_resource = resource_statuses[resource_index]
			resource_statuses[resource_index][town_resource_status.NEED_ALOT] += scarcity_price_modifier
			resource_statuses[resource_index][town_resource_status.NEED_RESOURCE] += scarcity_price_modifier

func calculate_resource_value(resource_name: String, resource_costs_array: PoolIntArray) -> int:
	var running_sum = 0;
	# TODO: Only neutral has subtraction modifier in formula, should this be the case?
	var negative_modifiers = [town_resource_status.NEUTRAL];
	var positive_modifiers = [town_resource_status.HAVE_EXCESS, town_resource_status.HAVE_ENOUGH, town_resource_status.NEED_RESOURCE, town_resource_status.NEED_ALOT];
	for resource_status in town_resource_status.values():
		if (resource_status in positive_modifiers):
			running_sum += (base_resource_value * resource_costs_array[resource_status]) * (1 + resource_value_modifiers[resource_status])
		else:
			running_sum += (base_resource_value * resource_costs_array[resource_status]) * (1 - resource_value_modifiers[resource_status])
			
	return running_sum

func update_values():
	#Equation: base_resource_value * (each array element) * (1 + [array value modifier])
	#Equation Example: gold_value = ((5 * 0) * (1 - .8)) + [array 2, 3, 4, 5]
	silver_value = calculate_resource_value("Silver", resource_status_silver);
	gold_value = calculate_resource_value("Gold", resource_status_gold);
	salt_value = calculate_resource_value("Salt", resource_status_salt);
	grapes_value = calculate_resource_value("Grapes", resource_status_grapes);
	wheat_value = calculate_resource_value("Wheat", resource_status_wheat);
	tea_value = calculate_resource_value("Tea", resource_status_tea);
	marble_value = calculate_resource_value("Marble", resource_status_marble);
	incense_value = calculate_resource_value("Incense", resource_status_incense);
	diamond_value = calculate_resource_value("Diamond", resource_status_diamond);
	fish_value = calculate_resource_value("Fish", resource_status_fish);
	lumber_value = calculate_resource_value("Lumber", resource_status_lumber);
	dyes_value = calculate_resource_value("Dyes", resource_status_dyes);
	coffee_value = calculate_resource_value("Coffee", resource_status_coffee);
	
	#silver_value = (((base_resource_value * resource_status_silver[0]) * (1+have_excess))+ ((base_resource_value * resource_status_silver[1]) * (1+have_enough))+ ((base_resource_value * resource_status_silver[2]) * (1-neutral))+ ((base_resource_value * resource_status_silver[3]) * (1+need_resource))+ ((base_resource_value * resource_status_silver[4]) * (1+need_alot)))

	silver_buy_value = (2 *silver_value)
	gold_buy_value = (2 *gold_value)
	salt_buy_value = (2 *salt_value)
	grapes_buy_value = (2 *grapes_value)
	wheat_buy_value = (2 *wheat_value)
	tea_buy_value = (2 *tea_value)
	marble_buy_value = (2 *marble_value)
	incense_buy_value = (2 *incense_value)
	diamond_buy_value = (2 *diamond_value)
	fish_buy_value = (2 *fish_value)
	lumber_buy_value = (2 *lumber_value)
	dyes_buy_value = (2 *dyes_value)
	coffee_buy_value = (2 *coffee_value)


	Global.city_name = city_name
	Global.SilverValue = silver_value
	Global.GoldValue = gold_value
	Global.SaltValue = salt_value
	Global.GrapesValue = grapes_value
	Global.WheatValue = wheat_value
	Global.TeaValue = tea_value
	Global.MarbleValue = marble_value
	Global.IncenseValue = incense_value
	Global.DiamondValue = diamond_value
	Global.FishValue = fish_value
	Global.LumberValue = lumber_value
	Global.DyesValue = dyes_value
	Global.CoffeeValue = coffee_value
	
	Global.SilverBuyValue = silver_buy_value
	Global.GoldBuyValue = gold_buy_value
	Global.SaltBuyValue = salt_buy_value
	Global.GrapesBuyValue = grapes_buy_value
	Global.WheatBuyValue = wheat_buy_value
	Global.TeaBuyValue = tea_buy_value
	Global.MarbleBuyValue = marble_buy_value
	Global.IncenseBuyValue = incense_buy_value
	Global.DiamondBuyValue = diamond_buy_value
	Global.FishBuyValue = fish_buy_value
	Global.LumberBuyValue = lumber_buy_value
	Global.DyesBuyValue = dyes_buy_value
	Global.CoffeeBuyValue = coffee_buy_value

func clear_values():
	Global.city_name = ""
	Global.SilverValue = 0
	Global.GoldValue = 0
	Global.SaltValue = 0
	Global.GrapesValue = 0
	Global.WheatValue = 0
	Global.TeaValue = 0
	Global.MarbleValue = 0
	Global.IncenseValue = 0
	Global.DiamondValue = 0
	Global.FishValue = 0
	Global.LumberValue = 0
	Global.DyesValue = 0
	Global.CoffeeValue = 0
	
	Global.SilverBuyValue = 0
	Global.GoldBuyValue = 0
	Global.SaltBuyValue = 0
	Global.GrapesBuyValue = 0
	Global.WheatBuyValue = 0
	Global.TeaBuyValue = 0
	Global.MarbleBuyValue = 0
	Global.IncenseBuyValue = 0
	Global.DiamondBuyValue = 0
	Global.FishBuyValue = 0
	Global.LumberBuyValue = 0
	Global.DyesBuyValue = 0
	Global.CoffeeBuyValue = 0

func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area"):
		update_values()
		#Signal goes to Event Bus and GUI
		Events.emit_signal("merchant_entered_city")


func _on_Area_area_exited(area):
	if(area.name == "Merchant_Area"):
		clear_values()
		#Signal goes to Event Bus and GUI
		Events.emit_signal("merchant_left_city")
