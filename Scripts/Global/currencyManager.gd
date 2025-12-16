extends Node

var gold: float
var soul: int

var goldPerSecond: float

var globalMultiplier: float
var goldMultiplier: float
var soulMultiplier: float

var initialGold: float = 100
var initialSoul: int = 1

var initialGlobalMultiplier: float = 1
var initialGoldMultiplier: int = 1
var initialSoulMultiplier: int = 1

signal goldChanged(newAmount: float)
signal soulChanged(newAmount: int)

func reset() -> void:
	goldPerSecond = 0
	gold = initialGold
	soul = initialSoul
	globalMultiplier = initialGlobalMultiplier
	goldMultiplier = initialGoldMultiplier
	soulMultiplier = initialSoulMultiplier
	
	goldPerSecond = calculateGoldPerSecond()

func calculateGoldPerSecond() -> float:
	goldPerSecond = 0
	var buildings = BuildingManager.buildings
	for building in buildings:
		goldPerSecond += buildings[building]["Amount"] * buildings[building]["Rate"]
	return goldPerSecond

func addGold(amount: float) -> void:
	gold += amount * globalMultiplier * goldMultiplier
	goldChanged.emit(gold)

func addSoul(amount: int) -> void:
	soul += amount * ceili(globalMultiplier * soulMultiplier)
	soulChanged.emit(soul)
