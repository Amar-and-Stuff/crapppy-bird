extends Node

var fired = false
@onready var level = load("res://level.tscn")
@onready var space_to_play = load("res://spacetoplay.tscn")
@onready var game = load("res://game.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	var Level = level.instantiate()
	var SpaceToPlay = space_to_play.instantiate()
	add_child(Level)
	add_child(SpaceToPlay)
	$TextureRect.process_mode = Node.PROCESS_MODE_PAUSABLE
	$Level.game_over.connect(reset_game)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not fired and (Input.is_action_just_pressed("start")):
		fired = true
		$TextureRect.visible = false
		get_tree().paused = false
	if not $BackgroundMusic.playing:
		$BackgroundMusic.play()

func reset_game():
	get_tree().change_scene_to_packed(game)
