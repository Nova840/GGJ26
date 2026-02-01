extends Area3D
class_name Finish


func _on_body_entered(body: Node3D) -> void:
	if body is PlayerRigidBody:
		Players.finished = true
		SceneTransition.change_scene("res://scenes/end_screen.tscn")
