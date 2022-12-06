extends Node

export var can_spawn_coffee = false
export var can_spawn_fish = false
export var can_spawn_gold = false
export var can_spawn_grapes = false
export var can_spawn_incense = false
export var can_spawn_salt = false
export var can_spawn_wheat = false

export var percent_chance_to_initially_drop_resource = .10

func _ready():
	_spawn_resources()
			
func _spawn_resources():
	if can_spawn_coffee:
		_spawn_coffee()
		
	if can_spawn_fish:
		_spawn_fish()
		
	if can_spawn_gold:
		_spawn_gold()
		
	if can_spawn_grapes:
		_spawn_grapes()
		
	if can_spawn_incense:
		_spawn_incense()
		
	if can_spawn_salt:
		_spawn_salt()
		
	if can_spawn_wheat:
		_spawn_wheat()

func _spawn_coffee():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Coffee.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1

func _spawn_fish():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Fish.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1
			
func _spawn_gold():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Gold.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1
			
func _spawn_grapes():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Grapes.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1
			
func _spawn_incense():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Incense.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1
	
func _spawn_salt():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Salt.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1
	
func _spawn_wheat():
	var percent = randf()
	if(percent > (1-percent_chance_to_initially_drop_resource)):
		var scene = load("res://Tiles//ResourceScenes/Resource-Wheat.tscn")
		var resource = scene.instance()
		add_child(resource)
		Global.total_resources_on_board += 1
