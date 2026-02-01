extends Area2D

class_name Damageable
@export var check : check_color
@export var damage : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(area_enter)
	pass # Replace with function body.



func area_enter(area : Area2D):
	if area is hp_Player:
		area.take_damage(damage)
	pass
