extends Node


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Exit") and not OS.has_feature("web"):
		get_tree().quit()
