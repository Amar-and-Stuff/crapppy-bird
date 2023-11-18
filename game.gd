extends Node

@onready var level = load("res://level.tscn")
@onready var space_to_play = load("res://spacetoplay.tscn")
@onready var end_screen = load("res://end_screen.tscn")

func _ready():
	var SpaceToPlay = space_to_play.instantiate()
	add_child(SpaceToPlay)
	$SpaceToPlay.started.connect(on_started)

func on_game_over(score):
	$Level.queue_free()
	var EndScreen = end_screen.instantiate()
	add_child(EndScreen)
	$EndScreen.restarted.connect(load_main_screen)
	$EndScreen.set_score(score)

func load_main_screen():
	$EndScreen.queue_free()
	var SpaceToPlay = space_to_play.instantiate()
	add_child(SpaceToPlay)
	$SpaceToPlay.started.connect(on_started)

func on_started():
	$SpaceToPlay.queue_free()
	var Level = level.instantiate()
	add_child(Level)
	$Level.game_over.connect(on_game_over)


func _on_background_music_finished():
	$BackgroundMusic.play()

func on_exit_pressed():
	get_tree().quit()
