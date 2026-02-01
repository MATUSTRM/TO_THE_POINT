extends Node2D

class_name flag

@export var animator: AnimationPlayer
@export var sfx_victory : AudioStream


func flag_active():
	audiomanager.play_sfx_oneshot(sfx_victory)
	animator.play("active")
