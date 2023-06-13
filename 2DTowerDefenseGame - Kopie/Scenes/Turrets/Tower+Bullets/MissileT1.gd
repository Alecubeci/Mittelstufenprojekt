extends StaticBody2D

var bullet = preload("res://Scenes/Turrets/Tower+Bullets/MissileBulletT1.tscn")
var bulletDamage = 10
var pathName
var currTarget = []
var curr

@onready var timer = get_node("Timer")
var startShooting = false

func _process(delta):
	if is_instance_valid(curr):
		self.look_at(curr.global_position)
		if timer.is_stopped():
			timer.start()
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()
			



func shoot():
	var tempBullet = bullet.instantiate()
	tempBullet.pathName = pathName
	tempBullet.bulletDamage = bulletDamage
	tempBullet.target = currTarget 
	get_node("BulletContainer").add_child(tempBullet)
	tempBullet.global_position = $Aim.global_position




func _on_tower_body_entered(body):
	if "EnemyA" in body.name:
		var tempArray = []
		var overlappingBodies = get_node("Tower").get_overlapping_bodies()
		
		for i in overlappingBodies:
			if "Enemy" in i.name:
				tempArray.append(i)		
			
		if tempArray.size() > 0:
			currTarget = tempArray[0].get_node("../")
			for i in tempArray:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		pathName = currTarget.get_parent().name
		curr = currTarget



func _on_tower_body_exited(body):
	currTarget = get_node("Tower").get_overlapping_bodies()


func _on_timer_timeout():
	shoot()
