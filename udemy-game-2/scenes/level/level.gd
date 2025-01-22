extends Node2D


@export var animal: PackedScene
@onready var animal_start: Marker2D = $AnimalStart


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_animal(animal)
	SignalManager.on_animal_died.connect(create_animal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func create_animal(ani: PackedScene = animal) -> void:
	var new_animal = ani.instantiate()
	new_animal.position = animal_start.position
	add_child(new_animal)
