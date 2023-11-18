extends Control

signal restarted
@onready var bird = $DeadBird
var tween_position
var tween_rotation

func _ready():
	animate()

func _on_button_pressed():
	if tween_position or tween_rotation:
		tween_rotation.kill()
		tween_position.kill()
	emit_signal("restarted")

func set_score(score):
	$Label.text = "Your Score is : " + str(score)

func animate():
	bird.position = Vector2(-100, 648/2)
	bird.rotation_degrees = 0
	if tween_position or tween_rotation:
		tween_rotation.kill()
		tween_position.kill()
	tween_position = get_tree().create_tween()
	tween_rotation = get_tree().create_tween()
	tween_position.tween_property(bird,"position",Vector2(1200,648/2),5)
	tween_rotation.tween_property(bird,"rotation_degrees",360,5)
	tween_position.tween_callback(animate)
