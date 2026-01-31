extends Label
class_name DistanceLabel


func _process(delta: float) -> void:
	text = str(floori(Players.instance.get_distance_of_tank())) + "M"
