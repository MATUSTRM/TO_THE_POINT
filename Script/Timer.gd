extends Control

signal start
@export var playercontroller : player_controller 
@export var level : line_level
@export var animator : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator.play("pop_up")
	start.connect(Callable(level,"road_active"))
	start.connect(Callable(playercontroller,"active_player"))
	pass # Replace with function body.


func emitir_start():
	emit_signal("start")
