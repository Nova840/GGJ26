extends Node


@onready var player_template: AudioStreamPlayer = $AudioStreamPlayerTemplate


func play(stream: AudioStream) -> void:
	var sound_player: AudioStreamPlayer = player_template.duplicate()
	add_child(sound_player)
	sound_player.stream = stream
	sound_player.play()
	await get_tree().create_timer(10).timeout
	sound_player.queue_free()
