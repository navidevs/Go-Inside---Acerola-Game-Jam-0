extends Node2D
var rotation_speed = 1

var has_entered_tilt_point = false
var has_entered_split_point = false
var has_landed_on_sun = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_entered_tilt_point:
		##rotate the wave
		$CharacterBody2D.rotation += rotation_speed * delta

	#if has_landed_on_sun:
		


func _on_tilt_point_body_entered(body):
	#$CharacterBody2D.rotation = deg_to_rad(-90)
	has_entered_tilt_point = true
	





