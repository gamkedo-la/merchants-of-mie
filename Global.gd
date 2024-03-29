extends Node

const MAX_TURNS = 20
const FLAT_COST_PER_TURN = 1
var current_scene = null
var turn_number = 0
var is_player_turn = true
var resources_in_inventory = []

onready var action_Points_available = 5
onready var action_Points_Per_Turn = 5 

onready var total_resources_on_board = 0

onready var currency_available = 20

# Objective Text
#this is just the inventory item (not the sentence)
var objective_one_text = ""
var objective_two_one_text = ""
var objective_two_two_text = ""
var objective_two_three_text = ""

# This is the entire sentence that is displayed
var objective_one_text_concatenate = ""
var objective_two_one_text_concatenate = ""
var objective_two_two_text_concatenate = ""
var objective_two_three_text_concatenate = ""

var objective_one_count = 0
var objective_two_item_one_count = 0
var objective_two_item_two_count = 0
var objective_two_item_three_count = 0 

var first_objective_completed = false
var secondary_objectives_completed = false

var flavor_text = ""
var functional_text = ""

#Mouse Hovering Over Castle
var mouse_is_hovering_over_castle = false

#Mouse Hovering Over merchant
var mouse_is_hovering_over_merchant = false


#Getting the value of goods per city
var city_name = ""

var resource_names = [
"Silver",
"Gold",
"Salt",
"Grapes",
"Wheat",
"Tea",
"Marble",
"Incense",
"Diamond",
"Fish",
"Lumber",
"Dyes",
"Coffee"
]

var SilverValue = 0
var GoldValue = 0
var SaltValue = 0
var GrapesValue = 0
var WheatValue = 0
var TeaValue = 0
var MarbleValue = 0
var IncenseValue = 0
var DiamondValue = 0
var FishValue = 0
var LumberValue = 0
var DyesValue = 0
var CoffeeValue = 0

var SilverBuyValue = 0
var GoldBuyValue = 0
var SaltBuyValue = 0
var GrapesBuyValue = 0
var WheatBuyValue = 0
var TeaBuyValue = 0
var MarbleBuyValue = 0
var IncenseBuyValue = 0
var DiamondBuyValue = 0
var FishBuyValue = 0
var LumberBuyValue = 0
var DyesBuyValue = 0
var CoffeeBuyValue = 0

var merchant_name = ""
var merchant_flavor_text = ""

var current_merchant_inv_one = ""
var current_merchant_inv_two = ""
var current_merchant_inv_three = ""

var west_rymare_lockdown = false
var doveshire_lockdown = false
var vine_river_lockdown = false
var easthaven_lockdown = false
var greenglade_lockdown = false
var dro_hills_lockdown = false

var west_rymare_countdown = 0
var doveshire_countdown = 0
var vine_river_countdown = 0
var easthaven_countdown = 0
var greenglade_countdown = 0
var dro_hills_countdown = 0

var silver_multiplier = 1
var gold_multiplier = 1
var salt_multiplier = 1
var grapes_multiplier = 1
var wheat_multiplier = 1
var tea_multiplier = 1
var marble_multiplier = 1
var incense_multiplier = 1
var diamond_multiplier = 1
var fish_multiplier = 1
var lumber_multiplier = 1
var dyes_multiplier = 1
var coffee_multiplier = 1

var silver_modifier_changed = false
var gold_modifier_changed = false
var salt_modifier_changed = false
var grapes_modifier_changed = false
var wheat_modifier_changed = false
var tea_modifier_changed = false
var marble_modifier_changed = false
var incense_modifier_changed = false
var diamonds_modifier_changed = false
var fish_modifier_changed = false
var lumber_modifier_changed = false
var dyes_modifier_changed = false
var coffee_modifier_changed = false

var silver_turn_countdown = 0
var gold_turn_countdown = 0
var salt_turn_countdown = 0
var grapes_turn_countdown = 0
var wheat_turn_countdown = 0
var tea_turn_countdown = 0
var marble_turn_countdown = 0
var incense_turn_countdown = 0
var diamonds_turn_countdown = 0
var fish_turn_countdown = 0
var lumber_turn_countdown = 0
var dyes_turn_countdown = 0
var coffee_turn_countdown = 0

var item_picked_up_name = ""

var item_buy_name = ""

func _ready():
	print("At turn start, player has: " + str(action_Points_Per_Turn) + " available")
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	if SettingsManager.soundtrack_enabled():
		SettingsManager.play_mainsoundtrack();

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
	SettingsManager.handle_new_scene()
	
