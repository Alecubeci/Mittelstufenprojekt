extends Node3D

@export var speed = 70

const KILL_BULLET = 2
var timer = 0
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var forward_direction = global_transform.basis.z.normalized()
	global_translate(forward_direction * speed * delta)
	
	timer += delta
	if timer >= KILL_BULLET:
		queue_free()


func _on_area_3d_body_entered(body):
	print("treffer" , body) # Replace with function body.
	queue_free()
