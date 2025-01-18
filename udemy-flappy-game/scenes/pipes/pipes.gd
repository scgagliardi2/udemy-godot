extends Node2D


class_name Pipes


const OFF_SCREEN: float = -500.0


@onready var score_sound: AudioStreamPlayer2D = $ScoreSound


func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta
	is_off_screen()


func is_off_screen() -> void:
	if position.x < OFF_SCREEN:
		queue_free()
	
	
func _on_screen_exited() -> void:
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	#if body.is_in_group(GameManager.GROUP_PLANE):
		#if body.has_method("die"):
			#body.die()
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		score_sound.play()
		GameManager.increment_score()
