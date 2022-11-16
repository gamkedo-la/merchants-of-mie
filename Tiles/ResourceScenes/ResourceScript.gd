extends Spatial

export var resource_name = "Coffee"

func _on_Area_area_entered(area):
	if(area.name == "Merchant_Area"):
		print("Merchant Picked Up: " + resource_name)
		queue_free()
	pass # Replace with function body.
