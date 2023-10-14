extends Node2D

var score = 0
@onready var bird = $Bird
signal game_over
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(bird.score)


func _on_obstacles_death_reported():
	game_over.emit()
