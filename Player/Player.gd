extends KinematicBody

export var purchased_merchant = false
export var active_merchant = false

var MoveAction = load("Actions/MoveAction.gd")
var action_queue

var path = []
var path_ind = 0
const MOVE_SPEED = 5
onready var amap = get_parent()


#signal out_of_trader_movement_points
# warning-ignore:unused_signal
signal end_turn


func _ready():
	var con_res
	if purchased_merchant:
		visible = true
	else:
		visible = false
		
	add_to_group("player")
	if not Events.is_connected("start_player_turn", self, "start_player_turn"):
		con_res = Events.connect("start_player_turn", self, "start_player_turn")
		assert(con_res == OK)
	action_queue = get_node("/root/GameSpace/ActionQueue")
	Global.merchant_name = $MerchantInfo.merchant_name
	Global.merchant_flavor_text = $MerchantInfo.concatenated_flavor	
	Events.emit_signal("update_merchant_flavor_text")
	
func _physics_process(delta):
	if not active_merchant:
		return
	
	if path_ind < path.size():
		var move_vec = (path[path_ind] - global_transform.origin)
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			move_and_slide(move_vec.normalized() * MOVE_SPEED, Vector3(0,1,0))
	
func handle_one_tile_move(move: MoveAction) -> void:
	if (move.map.get_path_cost(move.original_position, move.target_position) <= Global.action_Points_available):
		action_queue.execute(move)
	else:
		# TODO - Signal UI for feedback
		print_debug('Move too far')
				
func move_to(target_pos):
	if not active_merchant:
		return
	
	var g_transform = global_transform.origin
	var mov = MoveAction.new()
	mov.original_position = g_transform
	mov.target_position = target_pos
	mov.actor = self
	mov.map = amap
	if (SettingsManager.one_tile_per_move()):
		handle_one_tile_move(mov)
	else:
		action_queue.execute(mov) ## TODO: Validate expected behavior
	

func start_player_turn():
	Global.is_player_turn = true
	# Wait for feedback animation to finish
	yield(get_tree().create_timer(3), "timeout")
	
	print("Currently, it is the player's turn")
	
func turn_off_active_merchants():
	if active_merchant:
		active_merchant = false


func _on_PlayerPrototype_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed == true:

			if active_merchant == false:
				var merchants = get_tree().get_nodes_in_group("player")
				
				for x in merchants:
					x.active_merchant = false
				
				active_merchant = true
				Global.merchant_name = $MerchantInfo.merchant_name
				Global.merchant_flavor_text = $MerchantInfo.concatenated_flavor
				Events.emit_signal("update_merchant_flavor_text")


func _on_PlayerPrototype_mouse_entered():
	Global.mouse_is_hovering_over_merchant = true


func _on_PlayerPrototype_mouse_exited():
	Global.mouse_is_hovering_over_merchant = false
