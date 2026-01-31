extends Area2D

class_name Player
@export var hp : int 
@export var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_color():
	
	pass

func take_damage(damage : int):
	hp -= damage
	if hp < 1:
		die()
	

func die():
	set_collision_layer_value(2,false)
	sprite.visible = false
