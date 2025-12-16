extends Button

func _on_pressed() -> void:
	BuildingManager.buyBuilding("Bank", 1)
