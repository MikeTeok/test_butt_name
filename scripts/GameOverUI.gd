extends Control

onready var scoreLabel = $"CenterContainer/VBoxContainer/HBoxContainer2/ScoreLabel"
onready var hiScoreLabel = $"CenterContainer/VBoxContainer/HBoxContainer2/HiScoreLabel"
onready var restart_button = $CenterContainer/VBoxContainer/HBoxContainer/CenterContainer2/RestartButton
onready var home_button = $CenterContainer/VBoxContainer/HBoxContainer/CenterContainer/HomeButton
onready var board = $Board
signal restartRequest
onready var theme_mode = "Light mode" setget set_theme

func _ready():
	set_theme(theme_mode)

func update_scoreboard(score):
	scoreLabel.set_text("SCORE\n" + String(score))
	hiScoreLabel.set_text("BEST\n" + String(score))

func _on_RestartButton_pressed():
	emit_signal("restartRequest")

func set_theme(new_theme):
	theme_mode = new_theme
	restart_button.theme_mode = new_theme
	home_button.theme_mode = new_theme
	if new_theme == "Dark mode":
		board.modulate = Color("2A2A2A")
	else:
		board.modulate = Color("e1e6ec")
