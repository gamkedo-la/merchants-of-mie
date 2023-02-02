extends Node

var BaseAction = load("Actions/BaseAction.gd")
var actions_list = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	var con_res
	if not Events.is_connected("undo_actions", self, "undo"):
		con_res = Events.connect("undo_actions", self, "undo")
		assert(con_res == OK)
		
	if not Events.is_connected("end_player_turn", self, "clear"):
		con_res = Events.connect("end_player_turn", self, "clear")
		assert(con_res == OK)

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
