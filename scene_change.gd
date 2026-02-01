extends Node


@export var click_sound: AudioStream


func _process(delta: float) -> void:
	if Input.get_action_strength("AddForce1") >= 1 or Input.get_action_strength("AddForce1") >= 1:
		_on_pressed()


func _on_pressed():
	Sound.play(click_sound)
	SceneTransition.change_scene("res://Level/Level.tscn")
