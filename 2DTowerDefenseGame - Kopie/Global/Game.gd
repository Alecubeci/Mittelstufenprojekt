extends Node

var gold = 50  
var health = 100

@onready var gunT1 = preload("res://Scenes/Turrets/Tower+Bullets/GunT1.tscn") 
@onready var missleT1 = preload("res://Scenes/Turrets/Tower+Bullets/MissileT1.tscn")

@onready var tower 
@onready var enemy_path
