extends HSlider

onready var dark_theme = self.get_stylebox("slider").duplicate()
onready var number = $Number
onready var animation = $AnimationPlayer
onready var theme_mode = "Light mode" setget set_theme

func _ready():
	pass
	
func set_theme(new_theme):
	if new_theme == "Dark mode":
		dark_theme.bg_color = Color("4A4A4A")
		self.add_stylebox_override("slider", dark_theme)
	else:
		dark_theme.bg_color = Color("B6DFDF")
		self.add_stylebox_override("slider", dark_theme)


func _on_DifficultySlider_value_changed(value):
	number.set_text(str(value+1))
	animation.play("number_bob")
