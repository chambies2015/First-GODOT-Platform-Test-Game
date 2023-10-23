extends Area2D

@export var value = 1
var rotation_speed = 90

func _process(delta):
	rotation_degrees += rotation_speed * delta
	


func _on_body_entered(body):
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()
