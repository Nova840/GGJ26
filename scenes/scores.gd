extends Node


var scores_distance: Array[float]
var scores_time: Array[float]


func add_score_distance(score: float) -> void:
	scores_distance.append(score)
	# Descending
	scores_distance.sort_custom(func(a, b): return a > b)


func add_score_time(score: float) -> void:
	scores_time.append(score)
	# Ascending
	scores_time.sort_custom(func(a, b): return a < b)
