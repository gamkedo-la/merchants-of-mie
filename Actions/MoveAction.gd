extends BaseAction

var target_position: Vector3 = Vector3()
var original_position: Vector3 = Vector3()

func _init():
	sfx = load("Audio/SFX/TokenSlide.wav")

func execute():
	print("execute")
	actor.path = map.get_path_to_node(original_position, target_position)
	actor.path_ind = 0
	var path_action_cost = map.get_path_cost(original_position, target_position)
	if (SettingsManager.one_tile_per_move()):
		Global.action_Points_available -= path_action_cost
	else:
		Global.action_Points_available -= Global.FLAT_COST_PER_TURN

func undo():
	print("undo")
	actor.path = map.get_path_to_node(target_position, original_position)
	actor.path_ind = 0
	Global.action_Points_available +=1
