extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const dashSpeed = 4000.0
const dash = 400

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#supposedly the dash nvm it works 
	
	if Input.is_action_just_pressed("shift"):
		
		#this just asks the velocity yk
		if velocity.x > 0:
			velocity.x += 5000
		elif velocity.x < 0:
			velocity.x -= 5000
		else:
			#uhh yeah so uhh yeah
			print("oh this dash needs some serious debugging")
					
			
		
			

	move_and_slide()
