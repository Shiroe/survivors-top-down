extends CharacterBody2D

@onready var animation = $AnimatedSprite2D;
@export var SPEED = 150.0;

@onready var Kunai: PackedScene = preload("res://scenes/kunai_projectile.tscn");


func _physics_process(delta):
	if Input.is_action_pressed("Forward"):
		position.y -= SPEED * delta;
		animation.play("forward_walk");
	elif Input.is_action_pressed("Back"):
		position.y += SPEED * delta;
		animation.play("back_walk");
	elif Input.is_action_pressed("Left"):
		position.x -= SPEED * delta;
		animation.play("left_walk");
	elif Input.is_action_pressed("Right"):
		position.x += SPEED * delta;
		animation.play("right_walk");
	
	if Input.is_action_just_pressed("LeftClick"):
		shoot();

	move_and_slide();


func shoot():
	var k = Kunai.instantiate();
	owner.add_child(k);
	print('get_global_mouse_position(): ', get_global_mouse_position())
	print('global_position: ', animation.global_position)
	var dir = (get_global_mouse_position() - global_position)
	var angle = k.transform.x.angle_to(dir);
	k.global_position = self.global_position
	
	k.rotate(sign(angle) * abs(angle));

