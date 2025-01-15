extends Area2D


class_name Gem


signal on_gem_off_screen


@export var speed: float = 100.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = position.y + speed * delta

	if position.y > get_viewport_rect().size.y:
		set_process(false)
		on_gem_off_screen.emit()
		queue_free()
