extends Node2D

# TODO: Implement Balance Park challenges:
#  - Seesaw of Schedules activity balance puzzle.
#  - Break Dance healthy screen-time breaks.
#  - Dinner Bell Dash log-off mini-game.

func _ready() -> void:
    $CanvasLayer/UI/CompleteButton.pressed.connect(_on_complete_pressed)
    $CanvasLayer/UI/BackButton.pressed.connect(_on_back_pressed)

func _on_complete_pressed() -> void:
    game_state.award_badge("Balance")
    _return_to_hub()

func _on_back_pressed() -> void:
    _return_to_hub()

func _return_to_hub() -> void:
    get_tree().change_scene_to_file("res://scenes/CityHub.tscn")
