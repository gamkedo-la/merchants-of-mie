extends Node

export var resource_Name = ""

func _ready():
	var scene = load("res://Tiles//ResourceScenes/Resource-Gold.tscn")
	var resource = scene.instance()
	add_child(resource)
