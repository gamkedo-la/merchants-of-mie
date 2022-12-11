extends Node

const MAX_TURNS = 3
var current_scene = null
var turn_number = 0

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

func _ready():
	print("At turn start, player has: " + str(action_Points_Per_Turn) + " available")
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

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
