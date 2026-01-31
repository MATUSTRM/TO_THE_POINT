extends Node2D

class_name flag

@export var animator: AnimationPlayer


func flag_active():
	animator.play("active")
