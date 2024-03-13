extends Node2D

var has_entered_sun = false
var has_entered_split_point = false
var sun_speed = 25
var split_speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	#$"Lil Guy".position = $MovingSunMarker.position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var moving_sun_follow: PathFollow2D = $Path2D/PathFollow2D
	if Input.is_action_just_pressed("Cancel"):
		get_tree().change_scene_to_file("res://title_screen.tscn")
	if has_entered_sun:
		moving_sun_follow.progress += sun_speed * delta
	if has_entered_split_point:
		##split the sand
		$Sand.position.x -= split_speed * delta
		$Sand2.position.x += split_speed * delta


func _on_sun_movement_trigger_body_entered(body):
	has_entered_sun = true
	$"Lil Guy/Camera2D".zoom = Vector2(0.5,0.5)


func _on_sand_disappearance_area_body_entered(body):
	has_entered_split_point = true


func _on_win_box_body_entered(body):
	get_tree().change_scene_to_file("res://win_screen.tscn")


func _on_death_floor_body_entered(body):
	get_tree().change_scene_to_file("res://game_over.tscn")
