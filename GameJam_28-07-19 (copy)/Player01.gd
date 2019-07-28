extends KinematicBody2D

export (int) var SPEED = 400
var velocity = Vector2()
var screensize
var jumping = false
#signal new_game

const GRAVITY = 300.0
export (int) var WALK_SPEED = 200



func _physics_process(delta):

	if not is_on_floor():
		velocity.y += delta * GRAVITY
	elif not jumping: 
		velocity.y = 0
	elif is_on_floor() && jumping:
		jumping = false
	
#	if iscolliding():
#		print("collide!")
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))
#
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
	
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1
	
	if Input.is_action_just_pressed("ui_jump") && jumping == false: 
			velocity.y -= 300
			jumping = true


	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y-16)


func _ready():
	screensize = get_viewport_rect().size

#func _process(delta):
			
		
#	if Input.is_action_pressed("ui_restart"):
#		emit_signal("new_game")
	
	
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * SPEED
#
#	position += velocity * delta

func isonfloor():
	return position.y > screensize.y-40
	



#func _on_JumpTimer_timeout():
#	jumping = false
