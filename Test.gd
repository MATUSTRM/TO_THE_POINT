@tool
extends Node

class_name line_level


@export var path : Path2D
@export var pathf : PathFollow2D
@export var animator : AnimationPlayer
var cant : int
@export_group("Line")
@export var using : bool
@export var line : Line2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actualizar()
	pass # Replace with function body.
	



func actualizar():
	line.clear_points()
	if using:
		for cada_point in path.curve.point_count:
			line.add_point(path.curve.get_point_position(cant))
			cant +=1;
			print(cant)
			pass
			
func road_active():
	animator.play("road")

func road_stop():
	animator.stop()

func road_pause():
	animator.pause()
