extends Node

# Turn management signals
signal start_player_turn
signal start_board_turn
signal end_player_turn
signal end_board_turn

# Resource Pickup Signals
signal resource_picked_up(resource_name)
signal resource_dropped(resource_name)
signal resource_dropped_second(resource1_name, resource2_name, resource3_name)

#actions signals
signal undo_actions


signal merchant_clicked_castle
signal merchant_purchased

signal merchant_entered_city
signal merchant_left_city

#Resource Spawning Signals
signal spawn_gold
signal spawn_incense
signal spawn_coffee
signal spawn_fish
signal spawn_grapes
signal spawn_salt
signal spawn_wheat
signal spawn_tea
signal spawn_marble
signal spawn_diamond
signal spawn_dyes
signal spawn_lumber

signal update_merchant_flavor_text

signal update_objectives
signal update_UI

signal game_paused

signal settings_entered

signal sell_inv_one(resource_name)
signal sell_inv_two(resource_name)
signal sell_inv_three(resource_name)
signal buy_inv(resource_name)

signal update_global_inventory_tracking
