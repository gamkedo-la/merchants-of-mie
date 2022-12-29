extends Spatial

export var city_name = "West Rymare"

export var resource_names = [
#"Silver",
"Gold",
"Salt",
"Grapes",
"Wheat",
"Tea",
"Marble",
"Incense",
"Diamond",
"Fish",
#"Lumber",
#"Dyes",
"Coffee"
]

#Resource Values 
#Array, 0 = not current state, 1 = current state
#Array Placement = 0:  'Have Too Much' = -80% value + Rounded = 1
#Array Placement = 1:'Have Enough' = -40% + Rounded = 3
#Array Placement = 2:'Neutral' = 0% + Rounded = 5
#Array Placement = 3:'Need Resource' = +40% + Rounded = 7
#Array Placement = 4:'Desperately Need' = +80% + Rounded = 9
export var base_resource_value = 5
var have_excess = -.8
var have_enough = -.4
var neutral = 0
var need_resource = .4
var need_alot = .8

#export var resource_status_silver = [0,0,0,0,0]
export var resource_status_gold = [0,0,0,0,0]
export var resource_status_salt = [0,0,0,0,0]
export var resource_status_grapes = [0,0,0,0,0]
export var resource_status_wheat = [0,0,0,0,0]
export var resource_status_tea = [0,0,0,0,0]
export var resource_status_marble = [0,0,0,0,0]
export var resource_status_incense = [0,0,0,0,0]
export var resource_status_diamond = [0,0,0,0,0]
export var resource_status_fish = [0,0,0,0,0]
#export var resource_status_lumber = [0,0,0,0,0]
#export var resource_status_dyes = [0,0,0,0,0]
export var resource_status_coffee = [0,0,0,0,0]

#var silver_value = 0
var gold_value = 0
var salt_value = 0
var grapes_value = 0
var wheat_value = 0
var tea_value = 0
var marble_value = 0
var incense_value = 0
var diamond_value = 0
var fish_value = 0
#var lumber_value = 0
#var dyes_value = 0
var coffee_value = 0
		
func update_values():
	#Equation: base_resource_value * (each array element) * (1 + [array value modifier])
	#Equation Example: gold_value = ((5 * 0) * (1 - .8)) + [array 2, 3, 4, 5]
	
	#silver_value = (((base_resource_value * resource_status_silver[0]) * (1+have_excess))+ ((base_resource_value * resource_status_silver[1]) * (1+have_enough))+ ((base_resource_value * resource_status_silver[2]) * (1-neutral))+ ((base_resource_value * resource_status_silver[3]) * (1+need_resource))+ ((base_resource_value * resource_status_silver[4]) * (1+need_alot)))
	gold_value = (((base_resource_value * resource_status_gold[0]) * (1+have_excess))+ ((base_resource_value * resource_status_gold[1]) * (1+have_enough))+ ((base_resource_value * resource_status_gold[2]) * (1-neutral))+ ((base_resource_value * resource_status_gold[3]) * (1+need_resource))+ ((base_resource_value * resource_status_gold[4]) * (1+need_alot)))
	salt_value = (((base_resource_value * resource_status_salt[0]) * (1+have_excess))+ ((base_resource_value * resource_status_salt[1]) * (1+have_enough))+ ((base_resource_value * resource_status_salt[2]) * (1-neutral))+ ((base_resource_value * resource_status_salt[3]) * (1+need_resource))+ ((base_resource_value * resource_status_salt[4]) * (1+need_alot)))
	grapes_value = (((base_resource_value * resource_status_grapes[0]) * (1+have_excess))+ ((base_resource_value * resource_status_grapes[1]) * (1+have_enough))+ ((base_resource_value * resource_status_grapes[2]) * (1-neutral))+ ((base_resource_value * resource_status_grapes[3]) * (1+need_resource))+ ((base_resource_value * resource_status_grapes[4]) * (1+need_alot)))
	wheat_value = (((base_resource_value * resource_status_wheat[0]) * (1+have_excess))+ ((base_resource_value * resource_status_wheat[1]) * (1+have_enough))+ ((base_resource_value * resource_status_wheat[2]) * (1-neutral))+ ((base_resource_value * resource_status_wheat[3]) * (1+need_resource))+ ((base_resource_value * resource_status_wheat[4]) * (1+need_alot)))
	tea_value = (((base_resource_value * resource_status_tea[0]) * (1+have_excess))+ ((base_resource_value * resource_status_tea[1]) * (1+have_enough))+ ((base_resource_value * resource_status_tea[2]) * (1-neutral))+ ((base_resource_value * resource_status_tea[3]) * (1+need_resource))+ ((base_resource_value * resource_status_tea[4]) * (1+need_alot)))
	marble_value = (((base_resource_value * resource_status_marble[0]) * (1+have_excess))+ ((base_resource_value * resource_status_marble[1]) * (1+have_enough))+ ((base_resource_value * resource_status_marble[2]) * (1-neutral))+ ((base_resource_value * resource_status_marble[3]) * (1+need_resource))+ ((base_resource_value * resource_status_marble[4]) * (1+need_alot)))
	incense_value = (((base_resource_value * resource_status_incense[0]) * (1+have_excess))+ ((base_resource_value * resource_status_incense[1]) * (1+have_enough))+ ((base_resource_value * resource_status_incense[2]) * (1-neutral))+ ((base_resource_value * resource_status_incense[3]) * (1+need_resource))+ ((base_resource_value * resource_status_incense[4]) * (1+need_alot)))
	diamond_value = (((base_resource_value * resource_status_diamond[0]) * (1+have_excess))+ ((base_resource_value * resource_status_diamond[1]) * (1+have_enough))+ ((base_resource_value * resource_status_diamond[2]) * (1-neutral))+ ((base_resource_value * resource_status_diamond[3]) * (1+need_resource))+ ((base_resource_value * resource_status_diamond[4]) * (1+need_alot)))
	fish_value = (((base_resource_value * resource_status_fish[0]) * (1+have_excess))+ ((base_resource_value * resource_status_fish[1]) * (1+have_enough))+ ((base_resource_value * resource_status_fish[2]) * (1-neutral))+ ((base_resource_value * resource_status_fish[3]) * (1+need_resource))+ ((base_resource_value * resource_status_fish[4]) * (1+need_alot)))
	#lumber_value = (((base_resource_value * resource_status_lumber[0]) * (1+have_excess))+ ((base_resource_value * resource_status_lumber[1]) * (1+have_enough))+ ((base_resource_value * resource_status_lumber[2]) * (1-neutral))+ ((base_resource_value * resource_status_lumber[3]) * (1+need_resource))+ ((base_resource_value * resource_status_lumber[4]) * (1+need_alot)))
	#dyes_value = (((base_resource_value * resource_status_dyes[0]) * (1+have_excess))+ ((base_resource_value * resource_status_dyes[1]) * (1+have_enough))+ ((base_resource_value * resource_status_dyes[2]) * (1-neutral))+ ((base_resource_value * resource_status_dyes[3]) * (1+need_resource))+ ((base_resource_value * resource_status_dyes[4]) * (1+need_alot)))
	coffee_value = (((base_resource_value * resource_status_coffee[0]) * (1+have_excess))+ ((base_resource_value * resource_status_coffee[1]) * (1+have_enough))+ ((base_resource_value * resource_status_coffee[2]) * (1-neutral))+ ((base_resource_value * resource_status_coffee[3]) * (1+need_resource))+ ((base_resource_value * resource_status_coffee[4]) * (1+need_alot)))
	
	print(city_name)
	print(gold_value)
	print(salt_value)
	print(grapes_value)
	print(wheat_value)
	print(tea_value)
	print(marble_value)
	print(incense_value)
	print(diamond_value)
	print(fish_value)
	print(coffee_value)


func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area"):
		update_values()
