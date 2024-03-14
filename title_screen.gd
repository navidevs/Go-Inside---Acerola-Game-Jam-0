extends CanvasLayer
var selections: VBoxContainer
var selections_position: int = 0
var is_sound_on = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.is_fullscreen:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	if not Globals.is_sound_on:
		$AudioStreamPlayer.stop()
	selections = $Panel/Control/HBoxContainer/VBoxContainer2
	#selections_position = 0
	#selections = [$Control/HBoxContainer/VBoxContainer2/StartSelection,
		#$Control/HBoxContainer/VBoxContainer2/OptionsSelection,
		#$Control/HBoxContainer/VBoxContainer2/QuitSelection]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#selections.get_children()[selections_position].visible = true
	if Input.is_action_just_pressed("Accept") or Input.is_action_just_pressed("jump"):
		##TODO: handle what happens when you press enter
		if selections_position == 0:
			get_tree().change_scene_to_file("res://level.tscn")
		elif selections_position == 1:
			get_tree().change_scene_to_file("res://options_screen.tscn")
			#if is_sound_on == true:
				#is_sound_on = false
				#$Panel/Control/HBoxContainer/VBoxContainer/SoundToggle.text = "Sound:Off"
			#elif is_sound_on == false:
				#is_sound_on = true
				#$Panel/Control/HBoxContainer/VBoxContainer/SoundToggle.text = "Sound:On"
		elif selections_position == 2:
			##quit game
			get_tree().quit()
	
	elif Input.is_action_just_pressed("Cancel"):
		##if anywhere other than quit, go to quit. if at quit, quit game
		if selections_position == 2:
			##quit game
			get_tree().quit()
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

		

