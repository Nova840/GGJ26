extends Node


func _process(delta: float) -> void:
	if Input.get_action_strength("Exit") >= 1:
		get_tree().quit()
