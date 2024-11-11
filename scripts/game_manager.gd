extends Node

var score = 0
@onready var scoretext: Label = %Score

func add_point():
	score += 1
	print(score)
	scoretext.text = "SCORE: " + str(score)
