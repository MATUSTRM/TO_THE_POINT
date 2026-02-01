extends Node2D

class_name player_controller
enum colores{one, two}

@export var player : hp_Player
@export var color : colores
@export var active : bool
@export var sfx_change : AudioStream
@export var is_tutorial : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_color()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cambiar"):
		set_color()

func change_color():
	if active:
			audiomanager.play_sfx_oneshot(sfx_change)
			if color == 0:
				color = 1
			else:
				color = 0
			set_color()
			
			
func set_color():
	match color:
		colores.one:
			modulate = Color.WHITE
			player.set_collision_layer_value(5,true)
			player.set_collision_layer_value(6,false)
			
		colores.two:
			modulate = Color.BLACK
			player.set_collision_layer_value(5,false)
			player.set_collision_layer_value(6,true)


func active_player():
	if is_tutorial:
		is_tutorial = false
		return
	active = true
	
func inactive_player():
	active = false
