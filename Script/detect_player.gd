extends Area2D

var entro : bool
@export var level : line_level
@export var playercontroller : player_controller
@export_group("flag")
@export var using : bool
@export var bandera : flag
signal victory
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if level == null:
		push_warning("NO HAS AGREGADO EL LEVEL AL :", self.name)
		return
	area_entered.connect(on_area_entered)
	victory.connect(Callable(playercontroller,"inactive_player"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_area_entered(area : Node2D):
	if area is hp_Player:
		entro = true
		emit_signal("victory")
		level.call_deferred("road_pause")
		if !using:
			return
		else:
			bandera.call_deferred("flag_active")
	pass

func on_area_exited(area : Node2D):
	if area is hp_Player:
		entro = false
	pass
