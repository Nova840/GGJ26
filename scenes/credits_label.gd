extends Label


@export var scores_to_display: int = 10


func _ready() -> void:
	text = get_scores_text()


func get_scores_text() -> String:
	var t := ""
	var scores := 0
	for score in Scores.scores_time:
		scores += 1
		t += str(scores) + ": Finished! " + str(floori(score)) + " S\n"
		if scores >= scores_to_display: return t
	for score in Scores.scores_distance:
		scores += 1
		t += str(scores) + ": Died! " + str(floori(score)) + " M\n"
		if scores >= scores_to_display: return t
	return t
