extends Node2D

# SpinWheel class that handles the mechanics of a spinning wheel for profession selection and rewards.

var rotation_speed = 0.0  # Speed of rotation
var is_spinning = false  # Whether the wheel is currently spinning
var target_angle = 0.0  # Target angle to spin to

# Called every frame. Updates the rotation of the wheel.
func _process(delta):
    if is_spinning:
        rotation += rotation_speed * delta
        # Slow down the wheel as it approaches target angle.
        if abs(rotation - target_angle) < 0.1:
            rotation_speed = max(rotation_speed - 10, 0)
        
        # Stop spinning when close enough to target angle.
        if rotation_speed == 0:
            is_spinning = false
            rotation = target_angle  # Align rotation to target angle.

# Function to start spinning the wheel. Call this to initiate the spin.
func spin(target: float):
    target_angle = target  # Set the angle to spin to.
    rotation_speed = 180 + randf_range(0, 360)  # Random speed for realistic spin.
    is_spinning = true  # Start spinning

# Method to get the selected profession based on the final angle after stopping.
func get_selected_profession():
    # Implementation depending on the angles corresponding to professions.
    pass

# Example usage: Calling spin() on some user input.
# In the game, you would likely want a Button to trigger this.
# OnButtonPress.connect(spin_angle_function)