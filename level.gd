extends Node2D

@onready var bird = $Bird
signal game_over


func _process(delta):
	$Label.text = str(bird.score)


func _on_obstacles_death_reported():
	emit_signal("game_over",bird.score)


func _on_upper_end_body_entered(body):
	emit_signal("game_over",bird.score)


func _on_lower_end_body_entered(body):
	emit_signal("game_over",bird.score)
