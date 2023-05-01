extends Node3D

@export var speed = 50
@export var damage = 1

const KILL_BULLET = 2
var timer = 0
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var forward_direction = global_transform.basis.z.normalized()
	global_translate(forward_direction * speed * delta)
	
	timer += delta
	if timer >= KILL_BULLET:
		queue_free()


func _on_area_3d_body_entered(body: Node):
	queue_free()
	
	
	if body.has_node("Stats"):
		var stats_node = body.find_child("Stats") as Stats
		stats_node.take_hit(damage)
