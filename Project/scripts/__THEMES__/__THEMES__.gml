#region // Themes
/// @function	themes_load()
function themes_load() {
	loadscreen_text = "Loading Themes...";
	
	if !(directory_exists("Themes")) {
		directory_create("Themes");
	}
	
	// Load Theme
	var _map = ds_map_create();
	var _dir = working_directory + "Themes/";
	
	// Get list of theme folders
	var _dir_path = file_find_first(_dir + "*", fa_directory);
	
	while (_dir_path != "") {
		var _name = _dir_path;
		_dir_path = _dir + _name;
		var _file = file_text_open_read(_dir_path + "/" + _name + extension_themes);
		
		if (_file == -1) { break; }
		
		var _data = file_text_read_string(_file);
		_map[? _name] = json_parse(_data);
		
		loadscreen_text = _name + " Theme Loaded!";
		file_text_close(_file);
		
		// Next folder
		_dir_path = file_find_next();
	}
	
	// Arrays to RGB
	var _themes_count = ds_map_size(_map);
	var _theme = ds_map_find_first(_map);

	for (var i = 0; i < _themes_count; i++) {
		var _struct_sections = ["CHESS", "BG", "FG", "MISC"];
		var _struct_sections_size = array_length(_struct_sections);
		
		for (var j = 0; j < _struct_sections_size; j++) {
			var _struct_keys = variable_struct_get_names(_map[? _theme][$ _struct_sections[j]]);
			var _struct_keys_size = array_length(_struct_keys);
			
			for (var k = 0; k < _struct_keys_size; k++) {
				var _struct_hex = _map[? _theme][$ _struct_sections[j]][$ _struct_keys[k]];
				var _color = hex(_struct_hex);
				
				_map[? _theme][$ _struct_sections[j]][$ _struct_keys[k]] = _color;
			}
		}
		
		_theme = ds_map_find_next(_map, _theme);
	}

	// Return map of structs
	loadscreen_text = "";
	
	return _map;
}
	
/// @function	themes_get_assets()
function themes_get_assets() {
	var _theme_folder = working_directory + "Themes/" + CURRENT_THEME_NAME + "/";

	var _struct = {
		SPRITES : {
			CURSOR : sprite_add(_theme_folder + CURRENT_THEME.ASSETS.CURSOR, 1, false, 0, 0, 0),
			COLORS : sprite_add(_theme_folder + CURRENT_THEME.ASSETS.MOUSE_COLORS, 1, false, 0, 0, 0),
			MARKERS : sprite_add(_theme_folder + CURRENT_THEME.ASSETS.MARKERS, 1, false, 0, 0, 0),
			TOOLS  : sprite_add(_theme_folder + CURRENT_THEME.ASSETS.TOOLS, 1, false, 0, 0, 0),
			COMBOBOX  : sprite_add(_theme_folder + CURRENT_THEME.ASSETS.COMBOBOX, 1, false, 0, 2, 2),
		},
		FONTS : {
			SIZE : CURRENT_THEME.FONTS.SIZE
		}
	}
	
	_struct.SPRITES.FONT_REGULAR = sprite_add(_theme_folder + CURRENT_THEME.FONTS.REGULAR, 116, false, 0, 0, 0);
	_struct.SPRITES.FONT_BOLD = sprite_add(_theme_folder + CURRENT_THEME.FONTS.BOLD, 116, false, 0, 0, 0);
	
	_struct.FONTS.REGULAR = font_add_sprite_ext(_struct.SPRITES.FONT_REGULAR, font_mapstring, true, -2);
	_struct.FONTS.BOLD = font_add_sprite_ext(_struct.SPRITES.FONT_BOLD, font_mapstring, true, -1);

	return _struct;
}
#endregion