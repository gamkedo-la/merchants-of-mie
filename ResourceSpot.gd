extends Node

export var can_spawn_coffee = false
export var can_spawn_fish = false
export var can_spawn_gold = false
export var can_spawn_grapes = false
export var can_spawn_incense = false
export var can_spawn_salt = false
export var can_spawn_wheat = false
export var can_spawn_tea = false

export var percent_chance_to_initially_drop_resource = .10

func _ready():
	_spawn_resources()
	#Referencing Event Bus - find Global and subscribe to the signal, 
	#so when it is fired, trigger the function that is the 3rd variable ("_spawn_gold").
	Events.connect("spawn_coffee", self, "_spawn_coffee")
	Events.connect("spawn_fish", self, "_spawn_fish")
	Events.connect("spawn_gold", self, "_spawn_gold")
	Events.connect("spawn_grapes", self, "_spawn_grapes")
	Events.connect("spawn_incense", self, "_spawn_incense")
	Events.connect("spawn_salt", self, "_spawn_salt")
	Events.connect("spawn_wheat", self, "_spawn_wheat")
	Events.connect("spawn_wheat", self, "_spawn_tea")
	
	#Think about this - should this be per resource, or just hit _spawn_resources()?
			
			#maybe pass in a sting here
func _spawn_resources():
	_spawn_coffee()
	_spawn_fish()
	_spawn_gold()
	_spawn_grapes()
	_spawn_incense()
	_spawn_salt()
	_spawn_wheat()
	_spawn_tea()

func _spawn_coffee():
	if can_spawn_coffee:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Coffee.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1

func _spawn_fish():
	if can_spawn_fish:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Fish.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
			
func _spawn_gold():
	if can_spawn_gold:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Gold.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
			
func _spawn_grapes():
	if can_spawn_grapes:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Grapes.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
			
func _spawn_incense():
	if can_spawn_incense:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Incense.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
	
func _spawn_salt():
	if can_spawn_salt:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Salt.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
	
func _spawn_wheat():
	if can_spawn_wheat:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Wheat.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
			
func _spawn_tea():
	if can_spawn_tea:
		var percent = randf()
		if(percent > (1-percent_chance_to_initially_drop_resource)):
			var scene = load("res://Tiles//ResourceScenes/Resource-Tea.tscn")
			var resource = scene.instance()
			add_child(resource)
			Global.total_resources_on_board += 1
