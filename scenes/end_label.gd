extends Label


func _ready() -> void:
	text = "Distance: " + str(floori(Players.last_distance))
