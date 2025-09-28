extends Node2D

const DISTRICT_SCENES := {
    "Safety": "res://scenes/districts/SafetyDistrict.tscn",
    "Respect": "res://scenes/districts/RespectPlaza.tscn",
    "Information": "res://scenes/districts/InfoAlley.tscn",
    "Copyright": "res://scenes/districts/CopyrightCourt.tscn",
    "Balance": "res://scenes/districts/BalancePark.tscn"
}

@onready var _backpack: Control = $CanvasLayer/Backpack

func _ready() -> void:
    _connect_button("Safety", $CanvasLayer/Map/MarginContainer/VBoxContainer/MapGrid/SafetyButton)
    _connect_button("Respect", $CanvasLayer/Map/MarginContainer/VBoxContainer/MapGrid/RespectButton)
    _connect_button("Information", $CanvasLayer/Map/MarginContainer/VBoxContainer/MapGrid/InfoButton)
    _connect_button("Copyright", $CanvasLayer/Map/MarginContainer/VBoxContainer/MapGrid/CopyrightButton)
    _connect_button("Balance", $CanvasLayer/Map/MarginContainer/VBoxContainer/MapGrid/BalanceButton)
    $CanvasLayer/Map/MarginContainer/VBoxContainer/BackpackButton.pressed.connect(_on_backpack_pressed)

func _connect_button(district_key: String, button: Button) -> void:
    if button:
        button.pressed.connect(func(): _on_district_selected(district_key))

func _on_district_selected(district_key: String) -> void:
    var scene_path := DISTRICT_SCENES.get(district_key, "")
    if not scene_path.is_empty():
        get_tree().change_scene_to_file(scene_path)

func _on_backpack_pressed() -> void:
    if _backpack:
        _backpack.toggle_backpack()
