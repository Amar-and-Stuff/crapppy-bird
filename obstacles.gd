extends Node2D

@export var gap = 150
@export var y_offset = 0
@export var speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = y_offset
	$UpperObstacle.position.y = gap/2
	$LowerObstacle.position.y = 648 - gap/2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= (speed*delta)
	if position.x < -100:
		position.x = 1152 + 100
