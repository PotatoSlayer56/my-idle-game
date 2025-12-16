extends Label

func _ready() -> void:
	CurrencyManager.goldChanged.connect(update)

func update(newValue: float):
	self.text = " " + str(floori(newValue)) + " "
