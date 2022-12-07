extends Node

# Turn management signals
signal start_player_turn
signal start_board_turn
signal end_player_turn
signal end_board_turn

# Resource Pickup Signals
signal resource_picked_up(resource_name)
signal resource_dropped(resource_name)

#actions signals
signal undo_actions


signal merchant_entered_castle

#Resource Spawning Signals
signal spawn_gold
signal spawn_incense
signal spawn_coffee
signal spawn_fish
signal spawn_grapes
signal spawn_salt
signal spawn_wheat
