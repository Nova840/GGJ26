extends Button


@export var scene_to_load: String
@export var click_sound: AudioStream
@export var click_delay: float

@export var focus_on_ready: bool = true

@export var press_on_input: Array[String]

var time_created: float


func _ready() -> void:
	time_created = Time.get_ticks_msec() / 1000.0
	if focus_on_ready and Input.get_connected_joypads().size() > 0:
		grab_focus()


func _process(delta: float) -> void:
	if Time.get_ticks_msec() / 1000.0 - time_created < click_delay:
		return
	if (Input.is_action_just_pressed("AddForce1") or Input.is_action_just_pressed("AddForce2")) and has_focus():
		_on_pressed()
	for input in press_on_input:
		if Input.is_action_just_pressed(input):
			_on_pressed()


func _on_pressed():
	if SceneTransition.is_scene_changing:
		return
	Sound.play(click_sound)
	SceneTransition.change_scene(scene_to_load)
