extends CharacterBody2D

var score = 0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animatedSprite = $AnimatedSprite2D


func _physics_process(delta):
	
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("start"):
		$BirdFlap.play()
		velocity.y = JUMP_VELOCITY
		animatedSprite.play("default")
	move_and_slide()

func _on_bird_scored():
	$BirdScored.play()
