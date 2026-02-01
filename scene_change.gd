extends Node


@export var click_sound: AudioStream


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("AddForce1") or Input.is_action_just_pressed("AddForce1") :
		_on_pressed()


func _on_pressed():
	Sound.play(click_sound)
	SceneTransition.change_scene("res://Level/Level.tscn")
