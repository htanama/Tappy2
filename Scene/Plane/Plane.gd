extends CharacterBody2D

class_name Tappy
#signal  on_plane_died

@export var JUMP_POWER: float = -350.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer #hold ctrl Key to drop the AnimationPlayer 
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
#@export var jump_speed: float = 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(40, 136) #starting position


func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	
	if is_on_floor():
		die()
		

func fly(delta: float) -> void:
	velocity.y += _gravity * delta
	if Input.is_action_just_pressed("jump"):
		#print("jump is pressed")
		velocity.y = JUMP_POWER
		animation_player.play("jump") 
		animated_sprite_2d.play("fly")

func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
	SignalHub.custom_emit_on_plane_died()
	
