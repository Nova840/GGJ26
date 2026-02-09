extends TextureRect
class_name HurtImage


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	modulate = Color.TRANSPARENT
	Players.instance.damage_taken.connect(damage_taken)


func damage_taken() -> void:
	animation_player.stop()
	animation_player.play("fade")
