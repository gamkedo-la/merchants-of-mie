extends KinematicBody

var MoveAction = load("Actions/MoveAction.gd")
var action_queue

var path = []
var path_ind = 0
const MOVE_SPEED = 5
onready var amap = get_parent()


#signal out_of_trader_movement_points
signal end_turn


func _ready():
	add_to_group("player")
	Events.connect("start_player_turn", self, "start_player_turn")
	action_queue = get_node("/root/GameSpace/ActionQueue")
	
func _physics_process(delta):
	if path_ind < path.size():
		var move_vec = (path[path_ind] - global_transform.origin)
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			move_and_slide(move_vec.normalized() * MOVE_SPEED, Vector3(0,1,0))
			
func move_to(target_pos):
	var g_transform = global_transform.origin
	var mov = MoveAction.new()
	mov.original_position = g_transform
	mov.target_position = target_pos
	mov.actor = self
	mov.map = amap
	action_queue.execute(mov)
	

func start_player_turn():
	# Wait for feedback animation to finish
	yield(get_tree().create_timer(3), "timeout")
	
	print("Currently, it is the player's turn")
	#yield(player, "out_of_trader_movement_points")
		#The above 'yield' will hold the game at this state until we hit a certain trigger. 
		#We can stash anything we want in here, then we could have the turn advance with a signal or a button press
	#yield(get_tree().create_timer(0.5), "timeout")
	#Events.emit_signal("end_player_turn")
