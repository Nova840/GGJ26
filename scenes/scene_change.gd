extends Node


@export var scene_to_load: String
@export var click_sound: AudioStream
@export var click_delay: float

var time_created: float



func _ready() -> void:
	time_created = Time.get_ticks_msec() / 1000.0


func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("AddForce1") or Input.is_action_just_pressed("AddForce1")) \
			and Time.get_ticks_msec() / 1000.0 - time_created >= click_delay:
		_on_pressed()


func _on_pressed():
	Sound.play(click_sound)
	SceneTransition.change_scene(scene_to_load)
