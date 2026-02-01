extends Node2D

class_name player_controller
enum colores{one, two}

@export var player : hp_Player
@export var color : colores
@export var active : bool
@export var sfx_change : AudioStream
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_color()
	if active:
		if Input.is_action_just_pressed("cambiar"):
			audiomanager.play_sfx_oneshot(sfx_change)
			if color == 0:
				color = 1
			elif color == 1:
				color = 0



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
	active = true
	
func inactive_player():
	active = false
