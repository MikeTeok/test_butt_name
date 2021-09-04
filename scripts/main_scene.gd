extends Node

onready var mainMenu = $MainMenu
onready var background = $Background
onready var game = $Game
onready var gameOverUI = $GameOverUI

onready var theme_mode = {true: "Light mode", false: "Dark mode"}
var global_theme = true
var bgm_mute = false
var sfx_mute = false
var difficulty_level = 0

func _ready():
	set_theme(theme_mode[global_theme])
	mainMenu.get_node("CenterContainer/Playbutton/theme_button").toggle = global_theme
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), bgm_mute)
	mainMenu.get_node("CenterContainer/Playbutton/audio_button").toggle = !bgm_mute
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), sfx_mute)
	mainMenu.get_node("CenterContainer/Playbutton/sfx_button").toggle = !sfx_mute

func set_theme(new_mode):
	game.theme_mode = new_mode
	background.theme_mode = new_mode
	mainMenu.theme_mode = new_mode
	gameOverUI.theme_mode = new_mode

func _on_MainMenu_startRequest():
	mainMenu.hide()
	game.show()
	game.play()
	
func _on_MainMenu_changeThemeRequest():
	global_theme = !global_theme
	set_theme(theme_mode[global_theme])
	
func _on_Game_gameOver(combo):
	game.halt()
	game.hide()
	gameOverUI.update_scoreboard(combo)
	gameOverUI.show()

func _on_GameOverUI_restartRequest():
	gameOverUI.hide()
	game.show()
	game.play()

func _on_GameOverUI_mainMenuRequest():
	gameOverUI.hide()
	mainMenu.show()

func _on_MainMenu_changeBGMRequest():
	bgm_mute = !bgm_mute
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), bgm_mute)

func _on_MainMenu_changeSFXRequest():
	sfx_mute = !sfx_mute
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), sfx_mute)

func _on_MainMenu_changeDifficultyRequest(level):
	game.set_difficulty(level)

func get_save_stats():
	return {
		'name' : get_name(),
		'parent' : get_parent().get_path(),
		'theme_mode' : global_theme,
		'bgm_mute' : bgm_mute,
		'sfx_mute' : sfx_mute,
		'difficulty_level' : difficulty_level
	}

func load_save_stats(stats):
	self.global_theme = stats.theme_mode
	self.bgm_mute = stats.bgm_mute
	self.sfx_mute = stats.sfx_mute
