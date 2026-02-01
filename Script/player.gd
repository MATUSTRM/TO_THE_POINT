extends Area2D

class_name hp_Player
@export var hp : int 
@export var sprite : Sprite2D
@export var particle : CPUParticles2D
@export var sfx_die: AudioStream
@onready var trail_2d: Line2D = $"../Trail2D"

func take_damage(damage : int):
	hp -= damage
	if hp < 1:
		die()
	else:
		## ACA HABRA OTRO SONIDO PARA CUANDO RECIBA DANO
		pass
func die():
	trail_2d.visible = false
	particle.emitting = true
	audiomanager.play_sfx_oneshot(sfx_die)
	set_collision_layer_value(2,false)
	set_deferred("monitorable",false)
	sprite.visible = false
