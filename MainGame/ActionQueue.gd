extends Node

var BaseAction = load("Actions/BaseAction.gd")
var actions_list = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("undo_actions", self, "undo")
	Events.connect("end_player_turn", self, "clear")

func undo():
	print("AQUNDO")
	for i in range(actions_list.size(), 0, -1):
		actions_list[i-1].undo()
	clear()

func clear():
	print("clear")
	actions_list.clear()
	print(actions_list)

func execute(action: BaseAction):
	if Global.action_Points_available <= 0:
		return
	actions_list.append(action)
	
	SettingsManager.play_soundfx(action.sfx)
	action.execute()
	pass
