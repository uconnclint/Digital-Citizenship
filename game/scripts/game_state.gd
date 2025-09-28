extends Node

signal badge_awarded(badge_name: String)

var _badges: Dictionary = {}

func award_badge(badge_name: String) -> void:
    if badge_name.is_empty():
        return
    if not _badges.has(badge_name):
        _badges[badge_name] = true
        badge_awarded.emit(badge_name)

func has_badge(badge_name: String) -> bool:
    return _badges.get(badge_name, false)

func clear_badges() -> void:
    _badges.clear()

func get_badges() -> Array:
    return _badges.keys()
