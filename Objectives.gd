extends Spatial

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

var rand_resource_obj_one = 0
var rand_resource_obj_two_one = 0
var rand_resource_obj_two_two = 0
var rand_resource_obj_two_three = 0

func _ready():
	Events.connect("update_objectives", self, "update_count")
	randomize()
	Global.objective_one_count = randi() % (max_obj_one - min_obj_one) + min_obj_one
	
	Global.objective_two_item_one_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	Global.objective_two_item_two_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	Global.objective_two_item_three_count = randi() % (max_obj_two - min_obj_two) + min_obj_two
	
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
	update_count()
	pass 
	
func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area"):
		Events.emit_signal("merchant_entered_castle")
		Events.emit_signal("resource_dropped", possible_objectives[rand_resource_obj_one])

func update_count():
	Global.objective_one_text = possible_objectives[rand_resource_obj_one]
	Global.objective_two_one_text = possible_objectives[rand_resource_obj_two_one]
	Global.objective_two_two_text = possible_objectives[rand_resource_obj_two_two]
	Global.objective_two_three_text = possible_objectives[rand_resource_obj_two_three]
	
	Global.objective_one_text_concatenate = str("COLLECT ", Global.objective_one_count, " ", possible_objectives[rand_resource_obj_one])
	Global.objective_two_one_text_concatenate = str("COLLECT ", Global.objective_two_item_one_count, " ", possible_objectives[rand_resource_obj_two_one])
	Global.objective_two_two_text_concatenate = str("COLLECT ", Global.objective_two_item_two_count, " ", possible_objectives[rand_resource_obj_two_two])
	Global.objective_two_three_text_concatenate = str("COLLECT ", Global.objective_two_item_three_count, " ", possible_objectives[rand_resource_obj_two_three])
