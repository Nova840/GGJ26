extends Label


func _ready() -> void:
	if Players.finished:
		Scores.add_score_time(Players.last_time_existed)
		text = "Finished!\nTime: " + str(floori(Players.last_time_existed)) + " S"
	else:
		Scores.add_score_distance(Players.last_distance)
		text = "You Died!\nDistance: " + str(floori(Players.last_distance)) + " M"
