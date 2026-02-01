extends Node

@export var a_nivel : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	reiniciar()
	

func transicionar_a():
	transitionmanager.change_scene(a_nivel)
	
func reiniciar():
	if Input.is_action_just_pressed("r"):
		transitionmanager.Restart_scene()
