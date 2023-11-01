extends Area2D

var SPEED = 200;
@onready var timer = $Timer;

func _ready():
	timer.start();

func _physics_process(delta):
	position += transform.x * SPEED * delta;



func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.queue_free()
		queue_free()
	timer.timeout.connect(func(): queue_free());
