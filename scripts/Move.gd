extends KinematicBody2D

var velocity : Vector2
export (int) var speed = 200
onready var animationPlayer  = $AnimationPlayer
var direction = "Down"


func get_input():
	velocity = Vector2()
	
	if Input.is_key_pressed(32):
		if direction == "Down":
			animationPlayer.play("HitDown")
		if direction == "Right":
			animationPlayer.play("HitRight")
		if direction == "Up":
			animationPlayer.play("HitUp")
		if direction == "Left":
			animationPlayer.play("HitRight")

		return
	
	if Input.is_action_pressed("ui_right"):
		direction = "Right"
		velocity.x += 1
		$Sprite.flip_h = false
		
	if Input.is_action_pressed("ui_left"):
		direction = "Left"
		velocity.x -= 1
		$Sprite.flip_h = true

		
	if Input.is_action_pressed("ui_down"):
		direction = "Down"
		velocity.y += 1

	if Input.is_action_pressed("ui_up"):
		direction = "Up"
		velocity.y -= 1
		
	
	if velocity.x > 0:
		animationPlayer.play("RunRight")

	elif velocity.x < 0:
		animationPlayer.play("RunRight")

	elif velocity.y > 0:
		animationPlayer.play("RunDown")

	elif velocity.y < 0:
		animationPlayer.play("RunUp")

	else:
		if direction == "Right":
			animationPlayer.play("IdleRight")
		if direction == "Left":
			animationPlayer.play("IdleRight")
		if direction == "Up":
			animationPlayer.play("IdleUp")
		if direction == "Down":
			animationPlayer.play("IdleDown")
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
