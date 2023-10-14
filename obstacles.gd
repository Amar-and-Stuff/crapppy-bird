extends Node2D

@export var gap = 150
@export var speed = 150
signal death_reported
func _ready():
	$UpperObstacle.position.y = gap/2
	$LowerObstacle.position.y = 648 - gap/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= (speed*delta)
	if position.x < -100:
		reposition()


func _on_gap_area_body_entered(body):
	$BirdScored.play()
	body.score += 1


func _on_obstacle_body_entered(body):
	death_reported.emit()
	
func reposition():
	position.x = 1300
	position.y = randi_range(-50,50)
