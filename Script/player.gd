extends Area2D

class_name hp_Player
@export var hp : int 
@export var sprite : Sprite2D
@export var sfx_die: AudioStream

func take_damage(damage : int):
	hp -= damage
	if hp < 1:
		die()
	

func die():
	audiomanager.play_sfx_oneshot(sfx_die)
	set_collision_layer_value(2,false)
	set_deferred("monitorable",false)
	sprite.visible = false
