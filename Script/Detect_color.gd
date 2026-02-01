extends Sprite2D

class_name check_color

enum colores {one,two}
@export var damageable : Damageable
@export var color : colores
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_color()
	pass


func change_color():
	match color:
		colores.one:
			self_modulate = Color.WHITE
			damageable.set_collision_mask_value(5,true)
			damageable.set_collision_mask_value(6,false)
			
		colores.two:
			self_modulate = Color.BLACK
			damageable.set_collision_mask_value(5,false)
			damageable.set_collision_mask_value(6,true)
