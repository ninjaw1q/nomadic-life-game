extends Node

# NPC Class
class NPC:
    var name: String
    var profession: String
    var dialogues: Dictionary

    func _init(name: String, profession: String, dialogues: Dictionary):
        self.name = name
        self.profession = profession
        self.dialogues = dialogues

    func get_dialogue(): String:
        return dialogues.get("default", "..."

# Fisherman NPC
var fisherman = NPC.new("Fisherman", "Fisherman", {
    "default": "You want to learn fishing? I can teach you if you have the right materials.",
    "offer": "Bring me some fish, and I will tell you the secrets of the sea!"
})

# Hunter NPC
var hunter = NPC.new("Hunter", "Hunter", {
    "default": "Want to learn about hunting? It takes patience and skill.",
    "offer": "Bring me a fine deer pelt, and I will teach you everything I know."
})

# Blacksmith NPC
var blacksmith = NPC.new("Blacksmith", "Blacksmith", {
    "default": "Interested in forging weapons? You need to gather ores first.",
    "offer": "Bring me some iron ore, and I will teach you how to forge your own weapon!"
})