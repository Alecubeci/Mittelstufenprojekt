extends StaticBody2D

var bullet = preload("res://Scenes/Turrets/Gun1Bullet.tscn")
var bulletDamage = 5
var pathName
var currTarget = []
var curr


func _on_tower_body_entered(body):
		if "EnemyA" in body.name:
			var tempArray = []
			currTarget = get_node("Tower").get_overlapping_bodies()
			
		print(currTarget)


func _on_tower_body_exited(body):
	pass # Replace with function body.
