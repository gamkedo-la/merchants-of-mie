extends BaseAction

var target_position = Vector2()
var original_position = Vector2()

func _init():
	sfx = load("Audio/SFX/TokenSlide.wav")

func execute():
	print("execute")
	actor.path = map.get_path_to_node(original_position, target_position)
	actor.path_ind = 0
	Global.action_Points_available -= 1

func undo():
	print("undo")
	actor.path = map.get_path_to_node(target_position, original_position)
	actor.path_ind = 0
	Global.action_Points_available +=1
