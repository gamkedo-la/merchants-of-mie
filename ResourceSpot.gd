extends Node

export var can_spawn_coffee = false
export var can_spawn_fish = false
export var can_spawn_gold = false
export var can_spawn_grapes = false
export var can_spawn_incense = false

export var percent_chance_to_initially_drop_resource = .10

func _ready():
	if can_spawn_coffee:
		var percent = randf()
		print(percent)
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Coffee.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
	if can_spawn_fish:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Fish.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
	if can_spawn_gold:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Gold.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
	if can_spawn_grapes:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Grapes.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
	if can_spawn_incense:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Incense.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
