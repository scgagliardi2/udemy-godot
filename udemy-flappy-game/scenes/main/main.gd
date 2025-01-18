extends Control


@onready var highscore_number: Label = $MarginContainer/HighscoreNumber


func _ready() -> void:
	highscore_number.text = str(GameManager.get_high_score())
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
