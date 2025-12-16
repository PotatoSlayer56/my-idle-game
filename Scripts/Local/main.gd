extends Node2D

@onready var gameTickTimer: Timer = $gameTick

func _ready() -> void:
	BuildingManager.reset()
	CurrencyManager.reset()

func gameTick() -> void:
	CurrencyManager.addGold(CurrencyManager.goldPerSecond * gameTickTimer.wait_time)

func _on_game_tick_timeout() -> void:
	gameTick()
