extends CharacterBody2D

var score = 0
var is_alive = true

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0
@onready var sprite : Sprite2D = get_node("Sprite")
@onready var ui : Node = get_node("/root/MainScene/CanvasLayer/UI")
@onready var coin_audio_player : Node = get_node("/root/MainScene/Camera2D/AudioPlayer")
@onready var death_audio_player : Node = get_node("/root/MainScene/Camera2D/DeathAudio")


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if is_alive:  
		
		if not is_on_floor():
			velocity.y += gravity * delta

		
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		
		var direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		
		if velocity.x < 0:
			sprite.flip_h = true
		elif velocity.x > 0:
			sprite.flip_h = false

		move_and_slide()

func die():
	if is_alive:
		death_audio_player.play_death_SFX()
		velocity.x = 0
		velocity.y = 0
		is_alive = false
		await get_tree().create_timer(0.5).timeout
		get_tree().reload_current_scene()

func collect_coin(value):
	if is_alive:
		score += value
		ui.set_score_text(score)
		coin_audio_player.play_coin_SFX()
