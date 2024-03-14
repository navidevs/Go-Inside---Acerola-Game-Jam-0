extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	if not Globals.is_sound_on:
		$AudioStreamPlayer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Accept"):
	##load start of level
		get_tree().change_scene_to_file("res://level.tscn")
	elif Input.is_action_just_pressed("Cancel"):
	##load title screen
		get_tree().change_scene_to_file("res://title_screen.tscn")
