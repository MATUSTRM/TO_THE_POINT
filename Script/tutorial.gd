extends Area2D

var activado : bool
@export var playercontroller : player_controller
@export var animation_bar : AnimationPlayer
@export var path_ :line_level
@export var input_usado: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_enter)
	area_entered.connect(Callable(playercontroller,"active_player"))
	pass # Replace with function body.

func _process(delta: float) -> void:
	if activado:
		if Input.is_action_just_pressed("cambiar"):
			if input_usado == false:
				animation_bar.play("nice")
				path_.road_active()
				input_usado = true
			playercontroller.change_color()
	pass

func on_area_enter(body : Area2D):
	path_.road_pause()
	animation_bar.play("show")
	activado = true
	pass
