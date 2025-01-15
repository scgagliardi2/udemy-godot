extends Node2D

@export var pipes_scene: PackedScene
@onready var spawn_upper: Marker2D = $SpawnUpper
@onready var spawn_lower: Marker2D = $SpawnLower
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_container: Node = $PipesContainer

func _ready() -> void:
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_pipes() -> void:
	var new_pipes: Pipes = pipes_scene.instantiate()
	var yp: float = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	new_pipes.position = Vector2(spawn_upper.position.x, yp)
	pipes_container.add_child(new_pipes)
	


func _on_spawn_timer_timeout() -> void:
	spawn_pipes()
