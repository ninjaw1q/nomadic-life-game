extends KinematicBody2D

# Player movement speed
const SPEED = 200

var velocity = Vector2()

# Player inventory
var inventory = []

# Player profession
var profession = null

func _ready():
    # Initialization if needed
    pass

func _process(delta):
    # Get input
    velocity = Vector2()

    if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
    if Input.is_action_pressed('ui_right'):
        velocity.x += 1
    if Input.is_action_pressed('ui_up'):
        velocity.y -= 1
    if Input.is_action_pressed('ui_down'):
        velocity.y += 1

    velocity = velocity.normalized() * SPEED

    move_and_slide(velocity)

func add_item_to_inventory(item):
    inventory.append(item)

func set_profession(new_profession):
    profession = new_profession
