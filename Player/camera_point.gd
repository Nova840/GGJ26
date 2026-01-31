extends Node3D
class_name CameraPoint


@export var targets_array: Array[Node3D]
@export var camera_follow_speed: float


func _physics_process(delta: float) -> void:
	var average_target_position := targets_array[0].global_position
	for i in range(1, targets_array.size(), 1):
		average_target_position += targets_array[i].global_position
	average_target_position /= targets_array.size()

	global_position = global_position.lerp(average_target_position, camera_follow_speed * delta)
