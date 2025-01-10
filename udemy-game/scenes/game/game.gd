extends Node2D


@export var gem_scene: PackedScene

@onready var score_label: Label = $Label


var _score: int = 0


func _ready() -> void:
	spawn_gem()


func spawn_gem() -> void:
	var gem: Gem = gem_scene.instantiate()
	var x_pos: float = randf_range(70, 1050)
	gem.on_gem_off_screen.connect(game_over)
	gem.position = Vector2(x_pos, -50)
	add_child(gem)


func game_over() -> void:
	print("game over")


func _on_timer_timeout() -> void:
	spawn_gem()


func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	score_label.text = "Score: %05d" % _score
