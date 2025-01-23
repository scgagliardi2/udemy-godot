extends RigidBody2D


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


enum ANIMAL_STATE { READY, DRAG, RELEASE}
var _state: ANIMAL_STATE = ANIMAL_STATE.READY


func _physics_process(delta: float) -> void:
	update(delta)
	
	
func set_new_state(new_state: ANIMAL_STATE) -> void:
	_state = new_state
	if _state == ANIMAL_STATE.RELEASE:
		freeze = false
	elif _state == ANIMAL_STATE.DRAG:
		pass
	
	
func detect_release() -> bool:
	if _state == ANIMAL_STATE.DRAG:
		if Input.is_action_just_released("drag"):
			set_new_state(ANIMAL_STATE.RELEASE)
			return true
			
	return false


func update_drag() -> void:
	if detect_release():
		return
	
	var gmp = get_global_mouse_position()
	position = gmp
	
	
func update(delta: float) -> void:
	match _state:
		ANIMAL_STATE.DRAG:
			update_drag()
		ANIMAL_STATE.READY:
			pass
		ANIMAL_STATE.RELEASE:
			pass


func die() -> void:
	SignalManager.on_animal_died.emit()
	queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	die()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if _state == ANIMAL_STATE.READY and event.is_action_pressed("drag"):
		set_new_state(ANIMAL_STATE.DRAG)
