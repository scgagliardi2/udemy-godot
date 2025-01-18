extends Node


const SCORES_PATH = "user://tappy.dat"


const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")


const SCROLL_SPEED: float = 120.0
const GROUP_PLANE: String = "Plane"


var _score: int = 0
var _high_score: int = 0


func _ready() -> void:
	load_high_score()
	
	
func get_score() -> int:
	return _score


func get_high_score() -> int:
	return _high_score
	
	
func set_score(v: int) -> void:
	_score = v
	if _score > _high_score:
		_high_score = _score
		
	
	SignalManager.on_score_updated.emit(_score)
		
		
func increment_score() -> void:
	set_score(_score + 1)


func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)
	
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)


func load_high_score() -> void:
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			_high_score = file.get_32()
	else:
		print("Failed to load file")
	
	
func save_high_score() -> void:
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	if file:
		file.store_32(_high_score)
		file.close()
