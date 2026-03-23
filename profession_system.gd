extends Node

# Profession mechanics for fishing, hunting, and blacksmithing in the game

# Fishing Class
class Fishing:
    var success_rate = 0.7 # 70% success rate for fishing
    var bait_needed = 1 # Amount of bait needed per attempt

    func try_fish(bait_available:int) -> bool:
        if bait_available < bait_needed:
            return false
        return randf() < success_rate

# Hunting Class
class Hunting:
    var success_rate = 0.6 # 60% success rate for hunting
    var stamina_cost = 10 # Stamina cost per hunt

    func try_hunt(stamina_available:int) -> bool:
        if stamina_available < stamina_cost:
            return false
        return randf() < success_rate

# Blacksmith Class
class Blacksmith:
    var craft_time = 5.0 # Time in seconds to craft an item

    func craft_item(item_name:String) -> void:
        yield(get_tree().create_timer(craft_time), "timeout")
        print(item_name + " crafted.")

# Profession Rotation System
class ProfessionManager:
    var fishing: Fishing
    var hunting: Hunting
    var blacksmith: Blacksmith

    func _ready():
        fishing = Fishing.new()
        hunting = Hunting.new()
        blacksmith = Blacksmith.new()

    func perform_profession(action: String, resources:int) -> void:
        match action:
            "fish":
                if fishing.try_fish(resources):
                    print("Fishing successful!")
                else:
                    print("Failed to catch a fish.")
            "hunt":
                if hunting.try_hunt(resources):
                    print("Hunting successful!")
                else:
                    print("Failed to hunt an animal.")
            "craft":
                blacksmith.craft_item("Iron Sword")
            _:
                print("Invalid profession action.")
