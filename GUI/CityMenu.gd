extends Control

func _ready():
	Events.connect("merchant_entered_city", self, "_on_merchant_enter_city")
	Events.connect("merchant_left_city", self, "_on_merchant_left_city")

func _on_merchant_enter_city():
	visible = true

func _on_merchant_left_city():
	visible = false
