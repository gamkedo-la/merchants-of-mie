extends Node

# Turn management signals
signal start_player_turn
signal start_board_turn
signal end_player_turn
signal end_board_turn

# Resource Pickup Signals
signal resource_picked_up(resource_name)

#actions signals
signal undo_actions
