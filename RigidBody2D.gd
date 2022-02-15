extends KinematicBody2D
var speed=100
var ace =0.1
var andar=Vector2.ZERO
var ac
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	ac =((speed*ace)*(ace*100)*5)* delta
	velocity = velocity.move_toward(direction * ((speed*ace)*2), ac)

func _physics_process(delta):
	if andar != Vector2.ZERO:
		accelerate_towards_point(andar+Vector2(35,35), delta)
		move_and_slide(velocity)
		transform.origin.y+=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
