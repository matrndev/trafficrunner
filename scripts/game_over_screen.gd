extends Control

signal reset_pressed

func _on_reset_button_pressed() -> void:
	reset_pressed.emit()
