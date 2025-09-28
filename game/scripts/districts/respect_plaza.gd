extends Node2D

# TODO: Implement Respect Plaza activities:
#  - Chatroom Showdown empathy dialogue tree.
#  - Emoji Quest matching emotions.
#  - Compliment Catapult positivity mini-game.

func _ready() -> void:
    $CanvasLayer/UI/CompleteButton.pressed.connect(_on_complete_pressed)
    $CanvasLayer/UI/BackButton.pressed.connect(_on_back_pressed)

func _on_complete_pressed() -> void:
    game_state.award_badge("Respect")
    _return_to_hub()

func _on_back_pressed() -> void:
    _return_to_hub()

func _return_to_hub() -> void:
    get_tree().change_scene_to_file("res://scenes/CityHub.tscn")
