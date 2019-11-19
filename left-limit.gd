extends KinematicBody2D

var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var coll = move_and_collide(Vector2(10,0), true, true, true)
	if coll :
		#print ("1 point pour l'ordi")
		score += 1
		get_parent().get_parent().get_node("score2").set_text(str(score))
		var ball = get_parent().get_parent().get_node("ball")
		ball.restart()