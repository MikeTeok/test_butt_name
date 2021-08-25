extends Control

onready var scoreLabel = $"CenterContainer/VBoxContainer/HBoxContainer2/ScoreLabel"
onready var hiScoreLabel = $"CenterContainer/VBoxContainer/HBoxContainer2/HiScoreLabel"
signal restartRequest

func _ready():
	pass # Replace with function body.

func update_scoreboard(score):
	scoreLabel.set_text("SCORE\n" + String(score))
	hiScoreLabel.set_text("BEST\n" + String(score))

func _on_RestartButton_pressed():
	emit_signal("restartRequest")
