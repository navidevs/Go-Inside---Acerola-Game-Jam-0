extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Accept") or Input.is_action_just_pressed("Cancel") or Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://title_screen.tscn")
