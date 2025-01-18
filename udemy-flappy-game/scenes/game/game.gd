extends Node2D


@export var pipes_scene: PackedScene


@onready var spawn_upper: Marker2D = $SpawnUpper
@onready var spawn_lower: Marker2D = $SpawnLower
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_container: Node = $PipesContainer
@onready var plane: Tappy = $Plane
@onready var game_over: Control = $CanvasLayer/GameOver


func _ready() -> void:
	GameManager.set_score(0)
	SignalManager.on_plane_died.connect(_on_plane_died)
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
	
	
func stop_pipes():
	spawn_timer.stop()
	for pipe in pipes_container.get_children():
		pipe.set_process(false) 
		
		
func _on_plane_died():
	stop_pipes()
	game_over.set_visible(true)
