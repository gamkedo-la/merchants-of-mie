extends Spatial

export var first_objective = ""
export var second_objective_one = ""
export var second_objective_two = ""
export var second_objective_three = ""

var objective_one_count = 0
var objective_two_item_one_count = 0
var objective_two_item_two_count = 0
var objective_two_item_three_count = 0

var min_obj_one = 10
var max_obj_one = 15

var min_obj_two = 3
var max_obj_two = 10 

var possible_objectives = [
#"Silver",
"GOLD",
"SALT",
"GRAPES",
"WHEAT",
#"Tea",
#"Marble",
"INCENSE",
#"Diamonds",
"FISH",
#"Lumber",
#"Dyes",
"COFFEE"
]

var rand_resource_obj_one = 0
var rand_resource_obj_two_one = 0
var rand_resource_obj_two_two = 0
var rand_resource_obj_two_three = 0

func _ready():
	randomize()
	objective_one_count = randi() % (max_obj_one - min_obj_one) + min_obj_one
	
	objective_two_item_one_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	objective_two_item_two_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	objective_two_item_three_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	
	#first objective (1 item)
	rand_resource_obj_one = randi() % possible_objectives.size()
	
	#second objective - a set of 3 resources that are different
	rand_resource_obj_two_one = randi() % possible_objectives.size()
	
	#verifying resource 2 2 does not equal resource 2 1
	for n in possible_objectives.size():
		if(n == rand_resource_obj_two_one):
			continue
		else:
			rand_resource_obj_two_two = n
			break

	#verifying resource 2 3 does not equal resource 2 2 or 2 1
	for n in possible_objectives.size():
		if(n == rand_resource_obj_two_one):
			continue
		elif(n == rand_resource_obj_two_two):
			continue
		else:
			rand_resource_obj_two_three = n
			break

	Global.objective_one_text = str("COLLECT ", objective_one_count, " ", possible_objectives[rand_resource_obj_one])
	
	Global.objective_two_one_text = str("COLLECT ", objective_two_item_one_count, " ", possible_objectives[rand_resource_obj_two_one])
	Global.objective_two_two_text = str("COLLECT ", objective_two_item_two_count, " ", possible_objectives[rand_resource_obj_two_two])
	Global.objective_two_three_text = str("COLLECT ", objective_two_item_three_count, " ", possible_objectives[rand_resource_obj_two_three])
	pass 
	
func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area"):
		Events.emit_signal("merchant_entered_castle")
		print("Merchant has arrived to the city carrying: " + "MERCHANT RESOURCES" )
