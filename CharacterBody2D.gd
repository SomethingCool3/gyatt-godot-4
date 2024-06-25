extends CharacterBody2D

@export var accelaration: float = 2.0
@export var speed: float = 300.0

var input: Vector2
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var playerInput = get_input()
	
	velocity = lerp(velocity, playerInput * speed, delta * accelaration)
	
	move_and_slide()
	
func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()
