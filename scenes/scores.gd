extends Node


@export var save_path: String = "user://high_scores.txt"

var scores_distance: Array[float]
var scores_time: Array[float]


func _ready() -> void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var s := file.get_as_text()
		var arrays := s.split("\n")
		var dist_array := arrays[0].split(",")
		var time_array := arrays[1].split(",")
		for i in range(1, dist_array.size()):
			scores_distance.append(float(dist_array[i]))
		for i in range(1, time_array.size()):
			scores_time.append(float(time_array[i]))


func add_score_distance(score: float) -> void:
	scores_distance.append(score)
	# Descending
	scores_distance.sort_custom(func(a, b): return a > b)
	save()


func add_score_time(score: float) -> void:
	scores_time.append(score)
	# Ascending
	scores_time.sort_custom(func(a, b): return a < b)
	save()


func save() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var s := ""
	s += "Distance,"
	for sd in scores_distance:
		s += str(sd) + ","
	s = s.trim_suffix(",")
	s += "\n"
	s += "Time,"
	for st in scores_time:
		s += str(st) + ","
	s = s.trim_suffix(",")
	file.store_string(s)
