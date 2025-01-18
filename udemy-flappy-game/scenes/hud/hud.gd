extends Control


@onready var score: Label = $Score


func _ready() -> void:
	SignalManager.on_score_updated.connect(on_score_updated)



func on_score_updated(s: int) -> void:
	score.text = str(s)
