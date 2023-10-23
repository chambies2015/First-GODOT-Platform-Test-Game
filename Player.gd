extends CharacterBody2D

var score  = 0

const SPEED  = 300
const JUMP_VELOCITY  = 600
var gravity  = 800

var vel : Vector2 = Vector2()
@onready var sprite : Sprite2D = get_node("Sprite")


func _physics_process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= SPEED * delta
	if Input.is_action_pressed("move_right"):
		vel.x += SPEED * delta
		
	move_and_slide() 
