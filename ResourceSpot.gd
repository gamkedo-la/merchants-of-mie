extends Node

export var can_spawn_coffee = false
export var can_spawn_fish = false
export var can_spawn_gold = false
export var can_spawn_grapes = false
export var can_spawn_incense = false

func _ready():
	if can_spawn_coffee:
		var scene = load("res://Tiles//ResourceScenes/Resource-Coffee.tscn")
		var resource = scene.instance()
		add_child(resource)
	if can_spawn_fish:
		var scene = load("res://Tiles//ResourceScenes/Resource-Fish.tscn")
		var resource = scene.instance()
		add_child(resource)
	if can_spawn_gold:
		var scene = load("res://Tiles//ResourceScenes/Resource-Gold.tscn")
		var resource = scene.instance()
		add_child(resource)
	if can_spawn_grapes:
		var scene = load("res://Tiles//ResourceScenes/Resource-Grapes.tscn")
		var resource = scene.instance()
		add_child(resource)
	if can_spawn_incense:
		var scene = load("res://Tiles//ResourceScenes/Resource-Incense.tscn")
		var resource = scene.instance()
		add_child(resource)
