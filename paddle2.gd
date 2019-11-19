extends KinematicBody2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ball = get_parent().get_node("ball")
	var a = ball.velocity.angle()
	
	if cos(a) > 0 and position.x - ball.position.x < 500 :
		if ball.position.y < position.y  :
			move_and_collide(Vector2(0, -delta*speed))
			
		if  ball.position.y > position.y :
			move_and_collide(Vector2(0, delta*speed))
	else :
		if position.y > 310 : move_and_collide(Vector2(0, -delta*speed))
		elif position.y < 290 : move_and_collide(Vector2(0, delta*speed))
	
	
	
	
