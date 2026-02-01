extends Area2D

var activado : bool
@export var playercontroller : player_controller
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_enter)
	area_entered.connect(Callable(playercontroller,"active_player"))
	pass # Replace with function body.

func _process(delta: float) -> void:
	if activado:
		if Input.is_action_just_pressed("cambiar"):
			Engine.time_scale = 1
			playercontroller.change_color()
	pass

func on_area_enter(body : Area2D):
	Engine.time_scale = 0
	activado = true
	pass
