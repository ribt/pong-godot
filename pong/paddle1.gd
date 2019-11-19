extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('ui_cancel'):
		get_tree().quit()
	if Input.is_action_pressed('ui_up'):
		move_and_collide(Vector2(0, -delta*speed))
		
	if Input.is_action_pressed('ui_down'):
		move_and_collide(Vector2(0, delta*speed))
		

func _input(event):
	# Mouse in viewport coordinates
	if event is InputEventMouseMotion:
		if event.position.y > 0 and event.position.y < get_viewport().size.y :
			position.y = event.position.y
		move_and_collide(Vector2())
