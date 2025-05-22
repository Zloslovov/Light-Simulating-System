@tool
class_name LightSimulator
extends Node2D

var _texture : Texture2D
@export var texture : Texture2D:
	get:
		return _texture
	set(value):
		_texture = value
		update_image()

var _size = 100.0
@export var size : float :
	get:
		return _size
	set(value):
		_size = value
		update_image()

var _color : Color = Color.WHITE
@export var color : Color :
	get:
		return _color
	set(value):
		_color = value
		update_image()

var number : int = 3
@export var numer_of_circles : int:
	get:
		return number
	set(value):
		number = value
		update_image()

var _proportions : float = 1.0
@export_range(1, 10) var proportions : float:
	get:
		return _proportions
	set(value):
		_proportions = value
		update_image()

func _ready():
	update_image()

var circles = []

func update_image():
	var textureSize : float = max(texture.get_height(), texture.get_width())
	var applyedScale = size / textureSize
	
	if len(circles) != numer_of_circles:
		for circle in circles:
			if circle != null:
				remove_child(circle)
				circle.queue_free()
		circles = []
		
		for i in range(numer_of_circles):
			var obj : Sprite2D = Sprite2D.new()
			add_child(obj)
			circles += [obj]
	
	for i in range(numer_of_circles):
		var obj : Sprite2D = circles[i]
		var part = (1 / float(numer_of_circles))
		var portion = ((i + 1) / float(numer_of_circles)) ** proportions
		obj.texture = texture
		obj.modulate = color
		obj.modulate.a = color.a * part
		obj.scale = Vector2.ONE * applyedScale * portion
		print(str(obj.modulate.a) + " " + str(obj.scale))
