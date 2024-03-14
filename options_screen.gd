extends CanvasLayer
@onready var selections:VBoxContainer = $Panel/Control/HBoxContainer/VBoxContainer2
var selections_position:int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if not Globals.is_sound_on:
		$Panel/Control/HBoxContainer/VBoxContainer/SoundToggle.text = "Sound:Off"
	if not Globals.is_fullscreen:
		$Panel/Control/HBoxContainer/VBoxContainer/FullscreenToggle.text = "Fullscreen:Off"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Accept"):
		if selections_position == 0:
			if Globals.is_sound_on:
				Globals.is_sound_on = false
				$Panel/Control/HBoxContainer/VBoxContainer/SoundToggle.text = "Sound:Off"
			elif not Globals.is_sound_on:
				Globals.is_sound_on = true
				$Panel/Control/HBoxContainer/VBoxContainer/SoundToggle.text = "Sound:On"
		elif selections_position == 1:
			if Globals.is_fullscreen:
				Globals.is_fullscreen = false
				$Panel/Control/HBoxContainer/VBoxContainer/FullscreenToggle.text = "Fullscreen:Off"
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			elif not Globals.is_fullscreen:
				Globals.is_fullscreen = true
				$Panel/Control/HBoxContainer/VBoxContainer/FullscreenToggle.text = "Fullscreen:On"
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		elif selections_position == 2:
			get_tree().change_scene_to_file("res://title_screen.tscn")
	elif Input.is_action_just_pressed("Cancel"):
		if selections_position == 2:
			##switch to title screen
			get_tree().change_scene_to_file("res://title_screen.tscn")
		else:
			selections.get_children()[selections_position].modulate =  Color(0,0,0)
			selections_position = 2
			selections.get_children()[selections_position].modulate = Color(1,1,1)
	elif Input.is_action_just_pressed("down"):
		var old_selection = selections.get_children()[selections_position]
		var new_selection
		old_selection.modulate = Color(0,0,0)
		if selections_position < 2:
			selections_position += 1
		elif selections_position == 2:
			selections_position = 0
		new_selection = selections.get_children()[selections_position]
		new_selection.modulate = Color(1,1,1)

	elif Input.is_action_just_pressed("up"):
		var old_selection = selections.get_children()[selections_position]
		var new_selection
		old_selection.modulate = Color(0,0,0)
		if selections_position > 0:
			selections_position -= 1
		elif selections_position == 0:
			selections_position = 2
		new_selection = selections.get_children()[selections_position]
		new_selection.modulate = Color(1,1,1)
