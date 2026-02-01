extends Label


func _ready() -> void:
	if Players.finished:
		text = "Finished!\nTime: " + str(floori(Players.last_time_existed)) + " S"   
	else:
		text = "You Died!\nDistance: " + str(floori(Players.last_distance)) + " M"
