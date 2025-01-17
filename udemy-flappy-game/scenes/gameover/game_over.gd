extends Control


@onready var game_over_label: Label = $GameOverLabel
@onready var space_label: Label = $SpaceLabel
@onready var timer: Timer = $Timer
@onready var game_over_sound: AudioStreamPlayer2D = $GameOverSound


func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


func _process(delta: float) -> void:
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()

func on_plane_died() -> void:
	show()
	game_over_sound.play()
	timer.start()
	
	
func _on_timer_timeout() -> void:
	game_over_label.hide()
	space_label.show()
