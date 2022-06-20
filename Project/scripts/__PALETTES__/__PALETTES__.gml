#region // Palettes
/// @function	palettes_load()
function palettes_load() {
	loadscreen_text = "Loading Palettes...";
	
	if !(directory_exists("Palettes")) {
		directory_create("Palettes");
	}
	
	var _map = ds_map_create();	
	var _dir = working_directory + "Palettes/";
	var _path = file_find_first(_dir + "*" + extension_palettes, 0);
	
	if (_path == "") {
		exit;
	}
	
	while (_path != "") {
		var _name = filename_name(_path);	
		var _file = file_text_open_read(_dir + _path);
		var _data = file_text_read_string(_file);
	
		_name = string_replace(_name, extension_palettes, "");
		_map[? _name] = json_parse(_data);
		
		loadscreen_text = _name + " Palette Loaded!";
		
		_path = file_find_next();
	}
	
	// Colors hex to rgb
	var _palettes_count = ds_map_size(_map);
	var _palette = ds_map_find_first(_map);

	for (var i = 0; i < _palettes_count; i++) {
		var _colors_array = _map[? _palette].COLORS;
		var _colors_count = array_length(_colors_array);
		
		for (var j = 0; j < _colors_count; j++) {
			_map[? _palette].COLORS[j] = hex(_colors_array[j]);
		}
	}
	
	// Return map of structs
	loadscreen_text = "";
	return _map;
}
#endregion