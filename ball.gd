extends KinematicBody2D

var rng = RandomNumberGenerator.new()
var velocity = Vector2()
var acceleration = 1.03

func restart():
	position.x = 500
	position.y = 300
	rng.randomize()
	rotation = rng.randf_range(-PI/3, PI/3)
	velocity = Vector2(300, 0).rotated(rotation)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	restart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision :
		if collision.collider.name.begins_with("paddle") :
			var l = velocity.length()
			var angle = -0.01 * (position.y - collision.collider.position.y) # trust me i'm an engineer !
			if collision.collider.name == "paddle1" :
				velocity = Vector2(l*cos(angle), -l*sin(angle))*acceleration
			else :
				velocity = Vector2(-l*cos(angle), -l*sin(angle))*acceleration
		else :
			var reflect = collision.remainder.bounce(collision.normal)
			velocity = velocity.bounce(collision.normal)*acceleration
			move_and_collide(reflect)

	