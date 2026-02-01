extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.get_parent() is Players:
		return
	body.queue_free()
