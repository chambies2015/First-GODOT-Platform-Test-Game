extends Area2D

@export var speed = 100.0
@export var move_distance = 100.0
var rotation_speed = 270

@onready var start_x = position.x 
@onready var target_x = start_x + move_distance

func _process(delta):
	
	position.x = move_to(position.x, target_x, speed * delta)
	
	if position.x == target_x:
		if target_x == start_x:
			target_x = position.x + move_distance
		else:
			target_x = start_x
			
	rotation_degrees += rotation_speed * delta
	
func move_to (current, to, step):
	
	var new = current
	
	if new < to:
		new += step
		
		if new > to:
			new = to
	else:
		new -= step
		
		if new < to:
			new = to
			
	return new


func _on_body_entered(body):
	if body.name == "Player":
		body.die()
