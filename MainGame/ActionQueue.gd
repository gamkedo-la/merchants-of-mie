extends Node

var BaseAction = load("Actions/BaseAction.gd")
var actions_list = Array()

var token_move_sfx = load("Audio/SFX/TokenSlide.wav")

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
	
	
	$AudioStreamPlayer3D.stop()
	$AudioStreamPlayer3D.stream = token_move_sfx #default sound
	if (action.sfx!=null): # sound effect depending on resource type
		print("yay a custom sfx") # fixme this never fires
		$AudioStreamPlayer3D.stream = action.sfx
	$AudioStreamPlayer3D.play()
	
	action.execute()
	pass
