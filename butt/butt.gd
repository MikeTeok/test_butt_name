extends Node2D

onready var animation = $AnimationPlayer

signal timeout

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("grow")
	yield( animation, "animation_finished" )
	emit_signal("timeout")
