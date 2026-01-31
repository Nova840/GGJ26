extends TextureProgressBar
class_name OxygenGague


func _process(delta: float) -> void:
	value = Players.instance.oxygen_time / Players.instance.starting_oxygen_time
