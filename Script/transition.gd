extends CanvasLayer

@export var scene : PackedScene
@export var animator : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator.play("fade_out")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_scene(scene : PackedScene):
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().change_scene_to_packed(scene)
	animator.play_backwards("fade_out")
	pass
	

func Restart_scene():
	animator.play_backwards("fade_out")
	await animator.animation_finished
	get_tree().reload_current_scene()
	animator.play("fade_out")
