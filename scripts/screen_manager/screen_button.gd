class_name ScreenButton
extends Button #TODO Make TextureButton?

signal clicked(button: ScreenButton)

@export var group: String = "screen_buttons"
@export var button_type: ButtonType = ButtonType.NONE

enum ButtonType{
	Click = AudioConst.UI_SFX_CLICK,
	NegativeClick = AudioConst.UI_SFX_NEGATIVE,
	Negative2 = AudioConst.UI_SFX_CLOSE,
	NONE = 99
}

var is_clicked: bool = false


func _ready() -> void:
	add_to_group(group)
	pressed.connect(_on_pressed)
	focus_entered.connect(_on_focus_entered)
	focus_exited.connect(_on_focus_exited)
	var low_pass_idx: int = 1
	var lofi_idx: int = 2
	AudioServer.set_bus_effect_enabled(AudioConst.BUS_MUSIC_IDX, low_pass_idx, false)
	AudioServer.set_bus_effect_enabled(AudioConst.BUS_MUSIC_IDX, lofi_idx, false)


func _on_focus_entered() -> void:
	if not is_clicked: 
		#TODO AudioController.play_ui_sfx(AudioConst.UI_SFX_HOVER, 7)
		is_clicked = false
	else: is_clicked = false


func _on_focus_exited() -> void:
	pass

	
func _on_pressed() -> void:
	clicked.emit(self)
	#TODO AudioController.play_ui_sfx(button_type)