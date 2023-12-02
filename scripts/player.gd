extends CharacterBody2D

var width: int = 16

@warning_ignore("integer_division")
var stride_length: int = width / 2 ## pix
var speed: int = stride_length * 10

func _physics_process(_delta):
	var direction: Vector2 = Vector2.ZERO
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	# Check if the character is moving and set animations accordingly
	if direction != Vector2.ZERO:
		# Character is moving
		if direction.x != 0:
			$Animation.play("side_move")
			# Flip sprite if moving left
			$Animation.flip_h = (direction.x < 0)
		elif direction.y < 0:
			$Animation.play("back_move")
		elif direction.y > 0:
			$Animation.play("front_move")
	else:
		# Character is idle
		if velocity.x != 0:
			$Animation.play("side_idle")
			# Flip sprite if last direction was left
			$Animation.flip_h = (velocity.x < 0)
		elif velocity.y < 0:
			$Animation.play("back_idle")
		elif velocity.y > 0 or velocity == Vector2.ZERO:
			$Animation.play("front_idle")

	move_and_slide()
