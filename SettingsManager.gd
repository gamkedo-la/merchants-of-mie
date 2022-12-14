extends Node

const available_settings = {
	'Audio': [
		{
			'Name': 'Soundtrack',
			'Type': 'Checkbox',
		}, 
		{
			'Name': 'SFX',
			'Type': 'Checkbox',
		}]
};
var current_settings_idx_lookup = {};
var current_settings_idx: int = 0;
var popupmenus = [];
var is_soundtrack_enabled: bool = true;
var is_sfx_enabled: bool = true; 

signal settings_changed(old_settings, new_settings)
var current_settings_values = { 'Soundtrack' : true, 'SFX' : true };


var current_popupmenu: PopupMenu;
var soundtrack_audiostreamplayer: AudioStreamPlayer = null;
var sfx_audiostreamplayer: AudioStreamPlayer = null;

func handle_new_scene():
	popupmenus = [];
	current_popupmenu = null;
	current_settings_idx = 0;
	current_settings_idx_lookup = {};

func add_available_settings_to_popupmenu(popup_menu: PopupMenu) -> void:
	var setting_names = available_settings.keys();
	current_popupmenu = popup_menu;
	for setting in setting_names:	
		var setting_submenu = PopupMenu.new()
		setting_submenu.hide_on_item_selection = false;
		setting_submenu.hide_on_checkable_item_selection = false;
		setting_submenu.set_name(setting)
		for sub_setting in available_settings[setting]:
			var setting_name = sub_setting['Name'];
			current_settings_idx_lookup[setting_name] = current_settings_idx;
			if sub_setting['Type'] == 'Checkbox':
				setting_submenu.add_check_item(setting_name, current_settings_idx)
				setting_submenu.set_item_checked(current_settings_idx_lookup[setting_name], 
				current_settings_values[setting_name])
			current_settings_idx += 1;
		setting_submenu.connect("id_pressed", self, "_item_selected")
		popupmenus.append((setting_submenu));
		popup_menu.add_child(setting_submenu)
		popup_menu.add_submenu_item(setting, setting)

func handle_settings_changed(setting_name, new_value):
	initialize_audiostreamplayer();
	match (setting_name):
		'Soundtrack':
			if new_value:
				is_soundtrack_enabled = true;
				play_mainsoundtrack();
			else:
				is_soundtrack_enabled = false
				soundtrack_audiostreamplayer.stop();
		'SFX':
			if new_value:
				is_sfx_enabled = true;
			else:
				is_sfx_enabled = false;
	current_settings_values[setting_name] = new_value

func _item_selected(id: int):
	for popupmenu in popupmenus:
		var item_index = popupmenu.get_item_index(id);
		if item_index != -1:
			popupmenu.toggle_item_checked(item_index);
			var setting_being_viewed = popupmenu.get_item_text(item_index);
			var old_settings = current_settings_values;
			handle_settings_changed(setting_being_viewed, popupmenu.is_item_checked(item_index))
			emit_signal("settings_changed", old_settings, current_settings_values)

func initialize_settings(settings_button: MenuButton) -> void:
	var settings_popup_menu: PopupMenu = settings_button.get_popup()
	# Early escape case where this menubutton has a popupmenu already
	var current_settings = settings_popup_menu.get_item_count();
	if current_settings != 0:
		return;
	settings_popup_menu.hide_on_item_selection = false;
	settings_popup_menu.hide_on_checkable_item_selection = false;
	add_available_settings_to_popupmenu(settings_popup_menu)

func soundtrack_enabled() -> bool:
	return is_soundtrack_enabled
	
func sfx_enabled() -> bool:
	return is_sfx_enabled
	
func handle_play_mainsoundtrack():
	if soundtrack_enabled():
		soundtrack_audiostreamplayer.play();
	else:
		soundtrack_audiostreamplayer.stop();

func initialize_audiostreamplayer():
	if !is_instance_valid(soundtrack_audiostreamplayer) || soundtrack_audiostreamplayer == null:
		soundtrack_audiostreamplayer = AudioStreamPlayer.new();
	if !is_instance_valid(sfx_audiostreamplayer) || sfx_audiostreamplayer == null:
		sfx_audiostreamplayer = AudioStreamPlayer.new();
		sfx_audiostreamplayer.connect("finished", self, "_on_SfxTrack_finished");
	
func play_mainsoundtrack() -> void:
	initialize_audiostreamplayer();
	if !soundtrack_audiostreamplayer.is_inside_tree():
		get_tree().get_current_scene().add_child(soundtrack_audiostreamplayer)
		var audiofile = File.new();
		var soundtrack_path = 'res://Audio/Music/MerchantsMain.wav';
		if audiofile.file_exists(soundtrack_path):
			audiofile.open(soundtrack_path, audiofile.READ)
			var buffer = audiofile.get_buffer(audiofile.get_len());
			var merchantsmain_sample: AudioStreamSample = AudioStreamSample.new();
			merchantsmain_sample.data = buffer;
			merchantsmain_sample.format = AudioStreamSample.FORMAT_16_BITS;
			merchantsmain_sample.set_mix_rate(48000);
			merchantsmain_sample.set_stereo(true);
			merchantsmain_sample.loop_mode = AudioStreamSample.LOOP_FORWARD;
			merchantsmain_sample.set_loop_begin(0);
			merchantsmain_sample.loop_end = (merchantsmain_sample.mix_rate * merchantsmain_sample.get_length());
			audiofile.close();
			soundtrack_audiostreamplayer.stream = merchantsmain_sample;
			soundtrack_audiostreamplayer.bus = "Master";
			soundtrack_audiostreamplayer.pitch_scale = 1;
			soundtrack_audiostreamplayer.volume_db = -10;
			soundtrack_audiostreamplayer.set_mix_target(0);
			soundtrack_audiostreamplayer.autoplay = true;
	handle_play_mainsoundtrack();
		
func play_soundfx(action_sfx: AudioStream) -> void:
	if (!is_sfx_enabled):
		return
	initialize_audiostreamplayer();
	if !sfx_audiostreamplayer.is_inside_tree():
		get_tree().get_current_scene().add_child(sfx_audiostreamplayer)
	var token_move_sfx = load("Audio/SFX/TokenSlide.wav")
	sfx_audiostreamplayer.stream = token_move_sfx #default sound
	if (action_sfx != null): # sound effect depending on resource type
		sfx_audiostreamplayer.stream = action_sfx
	sfx_audiostreamplayer.play()
	
func _on_SfxTrack_finished():
	# event emitted when sfx complete
	pass

