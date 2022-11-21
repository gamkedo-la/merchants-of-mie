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
"Gold",
"Salt",
"Grapes",
"Wheat",
#"Tea",
#"Marble",
"Incense",
#"Diamonds",
"Fish",
#"Lumber",
#"Dyes",
"Coffee"
]

func _ready():
	randomize()
	objective_one_count = randi() % (max_obj_one - min_obj_one) + min_obj_one
	
	objective_two_item_one_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	objective_two_item_two_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	objective_two_item_three_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	
	var rand_resource_obj_one:int = randi() % possible_objectives.size()
	var rand_resource_obj_two_one:int = randi() % possible_objectives.size()
	var rand_resource_obj_two_two:int = randi() % possible_objectives.size()
	var rand_resource_obj_two_three:int = randi() % possible_objectives.size()
	
	print(str(possible_objectives[rand_resource_obj_one] , " " , objective_one_count))
	print(str(possible_objectives[rand_resource_obj_two_one] , " " , objective_two_item_one_count))
	print(str(possible_objectives[rand_resource_obj_two_two] , " " , objective_two_item_two_count))
	print(str(possible_objectives[rand_resource_obj_two_three] , " " , objective_two_item_three_count))
	pass 
	
func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area"):
		print("Merchant has arrived to the city carrying: " + "MERCHANT RESOURCES" )
