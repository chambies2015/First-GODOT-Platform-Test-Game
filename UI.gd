extends Control

@onready var score_text = get_node("Score Text")

func _ready():
	score_text.text = "0"
	
func set_score_text (score):
	score_text.text = str(score)
