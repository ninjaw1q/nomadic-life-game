# Main Game Controller Script

extends Node3D

# Variables for player and game settings
var player : Node3D
var profession_system : Dictionary = {
    "class": "warrior",
    "level": 1,
    "experience": 0
}
var npcs : Array = []

func _ready() -> void:
    # Initialization code
    player = $Player
    load_npcs()
    print("Game Initialized!")

func load_npcs() -> void:
    # Load NPCs into the game world
    # Example NPC loading
    var npc1 = NPC.new() # Assume NPC is another script defining NPC behavior
    npcs.append(npc1)
    add_child(npc1)

func _process(delta: float) -> void:
    handle_player_input(delta)

func handle_player_input(delta: float) -> void:
    # Handle player movement and actions
    if Input.is_action_pressed("ui_right"):
        player.position.x += 10 * delta
    if Input.is_action_pressed("ui_left"):
        player.position.x -= 10 * delta
    if Input.is_action_pressed("ui_up"):
        player.position.z -= 10 * delta
    if Input.is_action_pressed("ui_down"):
        player.position.z += 10 * delta

    # Check for interactions with NPCs
    for npc in npcs:
        if player.position.distance_to(npc.position) < 3:
            interact_with_npc(npc)

func interact_with_npc(npc: Node) -> void:
    print("Interacting with NPC: " + npc.name)
    # Interactions logic goes here

func update_profession(new_class: String) -> void:
    profession_system["class"] = new_class
    print("Profession updated to: " + new_class)

