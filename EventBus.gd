extends Node

# Turn management signals
# warning-ignore:unused_signal
signal start_player_turn
# warning-ignore:unused_signal
signal start_board_turn
# warning-ignore:unused_signal
signal end_player_turn
# warning-ignore:unused_signal
signal end_board_turn

# Resource Pickup Signals
# warning-ignore:unused_signal
signal resource_picked_up(resource_name)
# warning-ignore:unused_signal
signal resource_dropped(resource_name)
# warning-ignore:unused_signal
signal resource_dropped_second(resource1_name, resource2_name, resource3_name)

#actions signals
# warning-ignore:unused_signal
signal undo_actions


# warning-ignore:unused_signal
signal merchant_clicked_castle
# warning-ignore:unused_signal
signal merchant_purchased

# warning-ignore:unused_signal
signal merchant_entered_city
# warning-ignore:unused_signal
signal merchant_left_city

#Resource Spawning Signals
# warning-ignore:unused_signal
signal spawn_gold
# warning-ignore:unused_signal
signal spawn_incense
# warning-ignore:unused_signal
signal spawn_coffee
# warning-ignore:unused_signal
signal spawn_fish
# warning-ignore:unused_signal
signal spawn_grapes
# warning-ignore:unused_signal
signal spawn_salt
# warning-ignore:unused_signal
signal spawn_wheat
# warning-ignore:unused_signal
signal spawn_tea
# warning-ignore:unused_signal
signal spawn_marble
# warning-ignore:unused_signal
signal spawn_diamond
# warning-ignore:unused_signal
signal spawn_dyes
# warning-ignore:unused_signal
signal spawn_lumber

# warning-ignore:unused_signal
signal update_merchant_flavor_text

# warning-ignore:unused_signal
signal update_objectives
# warning-ignore:unused_signal
signal update_UI

# warning-ignore:unused_signal
signal game_paused

# warning-ignore:unused_signal
signal settings_entered

# warning-ignore:unused_signal
signal sell_inv_one(resource_name)
# warning-ignore:unused_signal
signal sell_inv_two(resource_name)
# warning-ignore:unused_signal
signal sell_inv_three(resource_name)
# warning-ignore:unused_signal
signal buy_inv(resource_name)

# warning-ignore:unused_signal
signal update_global_inventory_tracking
