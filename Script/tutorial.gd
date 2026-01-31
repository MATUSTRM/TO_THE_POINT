extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_enter)
	pass # Replace with function body.


func on_area_enter(body : Area2D):
	Engine.time_scale = 0
	pass
