extends RigidBody2D


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass


func die() -> void:
	queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	die()
