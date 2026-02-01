extends Node


@export var click_sound: AudioStream


func _on_pressed():
	Sound.play(click_sound)
	SceneTransition.change_scene("res://Level/Level.tscn")
