extends CanvasLayer


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect


func _ready() -> void:
	color_rect.color = Color.TRANSPARENT


func change_scene(file: String) -> void:
	animation_player.play("dissolve")
	
	await animation_player.animation_finished
	
	get_tree().change_scene_to_file(file)
	
	animation_player.play_backwards("dissolve")
