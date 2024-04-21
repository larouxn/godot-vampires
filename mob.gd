extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

	if velocity.length() > 0.0:
		%Slime.play_walk()

func take_damage():
	health -= 1

	if health == 0:
		queue_free()
