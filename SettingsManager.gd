extends Node

const available_settings = {
	'Audio': [
		{
			'Name': 'Soundtrack',
			'Type': 'Checkbox',
			'DefaultValue': true,
		}, 
		{
			'Name': 'SFX',
			'Type': 'Checkbox',
			'DefaultValue': false,
		}]
};

const current_settings_values = {
	'Soundtrack' : true,
	'SFX' : true
};
var current_settings_lookup = {};
var current_settings_idx: int = 0;

var is_soundtrack_enabled: bool = true;
var is_sfx_enabled: bool = true; 

var current_popupmenu: PopupMenu;
var popupmenus = [];

var soundtrack_audiostreamplayer: Node = null;

func handle_new_scene():
	popupmenus = [];
	current_popupmenu = null;

func add_available_settings_to_popupmenu(popup_menu: PopupMenu) -> void:
	var setting_names = available_settings.keys();
	current_popupmenu = popup_menu;
	for setting in setting_names:	
		var setting_submenu = PopupMenu.new()
		setting_submenu.hide_on_item_selection = false;
		setting_submenu.hide_on_checkable_item_selection = false;
		setting_submenu.set_name(setting)
		for sub_setting in available_settings[setting]:
			current_settings_values[sub_setting['Name']] = sub_setting['DefaultValue'];
			current_settings_lookup[sub_setting['Name']] = current_settings_idx;
			if sub_setting['Type'] == 'Checkbox':
				setting_submenu.add_check_item(sub_setting['Name'], current_settings_idx)
				setting_submenu.set_item_checked(current_settings_lookup[sub_setting['Name']], 
				sub_setting['DefaultValue'])
			current_settings_idx += 1;
		setting_submenu.connect("id_pressed", self, "_item_selected")
		popupmenus.append((setting_submenu));
		popup_menu.add_child(setting_submenu)
		popup_menu.add_submenu_item(setting, setting)

func handle_settings_changed():
	if current_settings_lookup['Soundtrack']:
		is_soundtrack_enabled = true;
	else:
		is_soundtrack_enabled = false;
	play_mainsoundtrack();
		
	if current_settings_lookup['SFX']:
		is_sfx_enabled = true;
	else:
		is_sfx_enabled = false;

func _item_selected(id: int):
	for popupmenu in popupmenus:
		var item_index = popupmenu.get_item_index(id);
		if item_index != -1:
			popupmenu.toggle_item_checked(item_index);
			var setting_being_viewed = popupmenu.get_item_text(item_index);

			current_settings_lookup[setting_being_viewed] = popupmenu.is_item_checked(item_index)
	handle_settings_changed()
	#for setting_name in current_settings_lookup.keys():
	#	if current_settings_lookup[setting_name] == id:
			

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

func play_mainsoundtrack() -> void:
	if !is_instance_valid(soundtrack_audiostreamplayer) || soundtrack_audiostreamplayer == null:
		soundtrack_audiostreamplayer = AudioStreamPlayer.new()

	if !soundtrack_audiostreamplayer.is_inside_tree():
		get_tree().get_current_scene().add_child(soundtrack_audiostreamplayer)
	else:
		handle_play_mainsoundtrack();
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
		#get_tree().get_current_scene().add_child(soundtrack_audiostreamplayer)
		handle_play_mainsoundtrack();
