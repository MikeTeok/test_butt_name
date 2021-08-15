extends Node2D

onready var animation = $AnimationPlayer
var animation_speed

signal timeout

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.playback_speed = self.animation_speed
	animation.play("grow")
	yield(animation, "animation_finished")
	emit_signal("timeout")

func init(speed = 1.0):
	self.animation_speed = speed
