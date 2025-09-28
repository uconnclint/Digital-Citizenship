extends Control

const BADGE_SLOTS := [
    "Safety",
    "Respect",
    "Information",
    "Balance",
    "Creativity"
]

@onready var _badge_container: GridContainer = $Panel/MarginContainer/VBoxContainer/BadgeGrid

func _ready() -> void:
    _populate_badge_slots()
    game_state.badge_awarded.connect(_on_badge_awarded)
    visible = false

func toggle_backpack() -> void:
    visible = not visible

func _populate_badge_slots() -> void:
    for child in _badge_container.get_children():
        child.queue_free()
    for badge_name in BADGE_SLOTS:
        var badge_label := Label.new()
        badge_label.text = _format_badge_label(badge_name)
        badge_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
        badge_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
        badge_label.size_flags_horizontal = Control.SIZE_FILL
        badge_label.size_flags_vertical = Control.SIZE_FILL
        _badge_container.add_child(badge_label)

func _on_badge_awarded(_badge_name: String) -> void:
    _refresh_badge_text()

func _refresh_badge_text() -> void:
    for child in _badge_container.get_children():
        if child is Label:
            var badge_name := child.text.split(":")[0]
            child.text = _format_badge_label(badge_name)

func _format_badge_label(badge_name: String) -> String:
    var earned := game_state.has_badge(badge_name)
    var status := earned ? "Earned" : "Locked"
    return "%s: %s" % [badge_name, status]
