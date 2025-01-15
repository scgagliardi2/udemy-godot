extends Area2D


@export var speed: float = 200.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x += -speed * delta

	if Input.is_action_pressed("right"):
		position.x += speed * delta
