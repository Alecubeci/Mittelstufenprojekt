extends CharacterBody2D

var target
var speed = 600
var pathName = ""
var bulletDamage
var range = 500

func _physics_process(delta):
	
	#var pathSpawnerNode = get_tree().get_root().get_node("GameScene/PathSpawner")
#
	#for i in  pathSpawnerNode.get_child_count():
	#	if pathSpawnerNode.get_child(i).name == pathName:
	#		target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
	#	
	#velocity = global_position.direction_to(target) * speed
#
	#look_at(target)

	if target and is_instance_valid(target) and global_position.distance_to(target.global_position) <= range:
		var direction = global_position.direction_to(target.global_position)
		velocity = direction * speed
		move_and_slide()




	
	move_and_slide()
	
	


func _on_area_2d_body_entered(body):
	if "EnemyA" in body.name:
		body.hp -= bulletDamage
		queue_free()
		
