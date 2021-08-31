extends Control

export (SpriteFrames)var icon_picture

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$toggle_button/AnimatedSprite.frames = icon_picture


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
