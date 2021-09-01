extends Node2D

var theme_mode setget set_theme
onready var animation = $ChangeThemeAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate = Color("D6FFFF")

func set_theme(new_mode):
	theme_mode = new_mode
	if theme_mode == "Light mode":
		animation.play("change_to_light")
	elif theme_mode == "Dark mode":
		animation.play("change_to_dark")
