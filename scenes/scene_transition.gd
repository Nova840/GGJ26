extends CanvasLayer


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

var is_scene_changing: bool = false


func _ready() -> void:
	color_rect.color = Color.TRANSPARENT


func change_scene(file: String) -> void:
	if is_scene_changing:
		return

	animation_player.play("dissolve")

	is_scene_changing = true
	await animation_player.animation_finished
	is_scene_changing = false

	get_tree().change_scene_to_file(file)
	if file == "res://Level/Level.tscn":
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	animation_player.play_backwards("dissolve")
