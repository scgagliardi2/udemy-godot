extends CharacterBody2D


class_name Tappy


const GRAVITY: float = 400.0
const POWER: float = -200.0


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var engine_sound: AudioStreamPlayer2D = $EngineSound


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()


func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("poweer")
		
		
func die() -> void:
	set_physics_process(false)
	engine_sound.stop()
	animated_sprite_2d.stop()
	SignalManager.on_plane_died.emit()
	
