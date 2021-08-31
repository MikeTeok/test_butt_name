extends Control

onready var scoreLabel = $"CenterContainer/VBoxContainer/HBoxContainer2/ScoreLabel"
onready var hiScoreLabel = $"CenterContainer/VBoxContainer/HBoxContainer2/HiScoreLabel"
onready var restart_button = $CenterContainer/VBoxContainer/HBoxContainer/CenterContainer2/RestartButton
onready var home_button = $CenterContainer/VBoxContainer/HBoxContainer/CenterContainer/HomeButton
onready var board = $Board
signal restartRequest
signal mainMenuRequest
onready var theme_mode = "Light mode" setget set_theme
var best = 0

func _ready():
	set_theme(theme_mode)

func update_scoreboard(score):
	scoreLabel.set_text("SCORE\n" + String(score))
	if (score > best):
		best = score
		hiScoreLabel.set_text("NEW BEST\n" + String(best))
	else:
		hiScoreLabel.set_text("BEST\n" + String(best))
	SaveState.save_game()

func _on_RestartButton_pressed():
	emit_signal("restartRequest")

func _on_HomeButton_pressed():
	emit_signal("mainMenuRequest")
	
func set_theme(new_theme):
	theme_mode = new_theme
	restart_button.theme_mode = new_theme
	home_button.theme_mode = new_theme
	if new_theme == "Dark mode":
		board.modulate = Color("2A2A2A")
	else:
		board.modulate = Color("e1e6ec")

func get_save_stats():
	return {
		'name' : get_name(),
		'parent' : get_parent().get_path(),
		'best' : best
	}

func load_save_stats(stats):
	self.best = stats.best
