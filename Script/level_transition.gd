extends Node

class_name Scene_controller
@export var objetivo : Objetivo
@export var a_nivel : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	objetivo.victory.connect(transicionar_a)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	reiniciar_input()
	

func transicionar_a():
	await get_tree().create_timer(2).timeout
	transitionmanager.change_scene(a_nivel)

func reiniciar():
		transitionmanager.Restart_scene()

func reiniciar_input():
	if Input.is_action_just_pressed("r"):
		transitionmanager.Restart_scene()
