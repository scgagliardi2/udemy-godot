extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")

const SCROLL_SPEED: float = 100.0
const GROUP_PLANE: String = "Plane"
var score: float = 0

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)
	
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
