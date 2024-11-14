extends RigidBody2D
@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager
@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func _on_area_2d_body_entered(body: Node2D) -> void:
	var y_delta = position.y - body.position.y
	var x_delta = body.position.x - position.x
	if (y_delta > 1):
		print("Destroy Enemy")
		queue_free()
		body.jump()
	else:
		print("Player health decrease")
		game_manager.decrease_health()
		if (x_delta > 0):
			player.jump_side(500)
		else: 
			player.jump_side(-500)
		
		



func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
