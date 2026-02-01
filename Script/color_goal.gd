extends Sprite2D

@export var color : colores
enum colores {one,two}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func change_color():
	match color:
		colores.one:
			self_modulate = Color.WHITE
			
		colores.two:
			self_modulate = Color.BLACK
