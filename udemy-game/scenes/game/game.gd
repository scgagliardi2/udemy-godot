extends Node2D


@export var gem_scene: PackedScene
@export var game_over_sound: AudioStreamWAV

@onready var score_label: Label = $Label
@onready var timer: Timer = $Timer
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var game_over_label: Label = $GameOver
@onready var background_music: AudioStreamPlayer = $BackgroundMusic

var _score: int = 0


func _ready() -> void:
	spawn_gem()


func spawn_gem() -> void:
	var gem: Gem = gem_scene.instantiate()
	var x_pos: float = randf_range(70, 1050)
	gem.on_gem_off_screen.connect(game_over)
	gem.position = Vector2(x_pos, -50)
	add_child(gem)

func stop_all() -> void:
	timer.stop()
	for child in get_children():
		child.set_process(false)

func play_dead_sound() -> void:
	score_sound.stop()
	score_sound.stream = game_over_sound
	score_sound.play()

func game_over() -> void:
	stop_all()
	game_over_label.set_visible(true)
	play_dead_sound()
	background_music.stop()


func _on_timer_timeout() -> void:
	spawn_gem()


func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	score_label.text = "%04d" % _score
	score_sound.position = area.position
	score_sound.play()
	area.queue_free()


func _on_button_button_up() -> void:
	game_over_label.set_visible(false)
	background_music.play()
	timer.start()
	
	for child in get_children():
		child.set_process(true)
	
