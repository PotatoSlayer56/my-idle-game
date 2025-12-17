extends Button

var type: String

func _ready() -> void:
	type = self.get_meta("buildingType")
	BuildingManager.buildingsChanged.connect(updateText)

func _on_pressed() -> void:
	BuildingManager.buyBuilding(type, 1)

func updateText(buildings: Dictionary) -> void:
	self.text = "Buy " + type + ": " + str(ceili(buildings[type]["Cost"]))
