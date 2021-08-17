extends Node2D

var theme_mode setget set_theme

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate = Color("111111")
	$Background.modulate = Color("ffffff")

func set_theme(new_mode):
	theme_mode = new_mode
	if theme_mode == "Light mode":
		$Sprite.modulate = Color("111111")
		$Background.modulate = Color("ffffff")
	elif theme_mode == "Dark mode":
		$Sprite.modulate = Color("ffffff")
		$Background.modulate = Color("1A1A1A")
