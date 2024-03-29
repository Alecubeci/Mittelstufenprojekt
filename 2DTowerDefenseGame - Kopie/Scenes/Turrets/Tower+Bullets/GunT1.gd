extends StaticBody2D

var bulletGun = preload("res://Scenes/Turrets/Tower+Bullets/Gun1Bullet.tscn")
var bulletMissile = preload("res://Scenes/Turrets/Tower+Bullets/MissileBulletT1.tscn")

var bullet = bulletGun
var bulletDamage = 5
var pathName
var currTarget = []
var curr
var range = 500
#func whichBullet():
#	if Game.tower == "res://Scenes/Turrets/Tower+Bullets/Gun1Bullet.tscn":
#bullet = 
#	elif Game.tower == "res://Scenes/Turrets/Tower+Bullets/Missile":
#		bullet = bulletMissile


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
	get_node("BulletContainer").add_child(tempBullet)
	tempBullet.global_position = $Aim.global_position

func _on_tower_body_entered(body):
		if "EnemyA" in body.get_parent().name:
			var tempArray = []
			currTarget = get_node("Tower").get_overlapping_bodies()
			
			print(currTarget)
			for i in currTarget:
				if "Enemy" in i.name:
					tempArray.append(i)		
			
			currTarget = null
			
			for i in tempArray:
				if currTarget == null:
					currTarget = i.get_node("../")
				else:
					if i.get_parent().get_progress() > currTarget.get_progress():
						currTarget = i.get_node("../")
			
			pathName = currTarget.get_parent().name
			
			curr = currTarget
			pathName = currTarget.get_parent().name  
			
			

func _on_tower_body_exited(body):
	currTarget = get_node("Tower").get_overlapping_bodies()


func _on_timer_timeout():
	shoot()
