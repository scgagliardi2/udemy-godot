extends Node2D


@export var animal: PackedScene
@onready var animal_start: Marker2D = $AnimalStart


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_animal(animal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func create_animal(ani: PackedScene) -> void:
	var new_animal = ani.instantiate()
	new_animal.position.y = animal_start.position.y
	new_animal.position.x = animal_start.position.x
	add_child(new_animal)
