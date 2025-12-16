extends Node

var buildings: Dictionary

var buildingCostIncreaseRate: float

var initialBuildings: Dictionary = {
	"Bank": {
		"Amount": 0,
		"Rate": 1,
		"Cost": 100
	},
}

signal buildingsChanged(newBuildings: Dictionary)

func reset() -> void:
	buildings = initialBuildings
	buildingCostIncreaseRate = 1.15

func changedBuildings() -> void:
	buildingsChanged.emit(buildings)
	CurrencyManager.calculateGoldPerSecond()

func buyBuilding(type: String, amount: int):
	var amountBought = 0
	for i in range(amount):
		if CurrencyManager.gold >= buildings[type]["Cost"]:
			CurrencyManager.addGold(-1 * buildings[type]["Cost"])
			buildings[type]["Cost"] *= buildingCostIncreaseRate
			amountBought += 1
	addBuilding(type, amountBought)

func addBuilding(type: String, amount: int) -> void:
	buildings[type]["Amount"] += amount
	changedBuildings()

func addBuildingAmount(type: String, amount: int) -> void:
	buildings[type]["Amount"] = amount
	changedBuildings()

func addBuildingRate(type: String, amount: int) -> void:
	buildings[type]["Rate"] += amount
	changedBuildings()

func setBuildingRate(type: String, amount: int) -> void:
	buildings[type]["Rate"] = amount
	changedBuildings()
