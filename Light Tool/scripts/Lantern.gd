extends Node2D

@export var Light : LightSimulator


var direction = 1
var function : float = 1.0
@export var factor = 0.1

func _process(delta):
	function -= delta * direction * factor
	if function < 0 or function > 1:
		direction *= -1
		function = int(absf(function))
	Light.proportions = 1.0 + function ** 2.3
