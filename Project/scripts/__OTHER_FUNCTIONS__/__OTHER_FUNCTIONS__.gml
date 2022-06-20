#region // Arrays
/// @function	array([*args])
/// @param	{any}	[*args]
function array() {
	var _args = [];
	
	for (var i = 0; i < argument_count; i++) {
		_args[i] = argument[i];
	}
	
	return _args;
}
	
///	@function	array_find_value(array, value)
/// @param	{array}	array
/// @param	{real}	value
function array_find_value(_arr, _val) {
	var _size = array_length(_arr);
	
	for (var i = 0; i < _size; i++) {
		if (_arr[i] == _val) {
			return true;
		}
	}
	
	return false;
}
#endregion

#region // Draw stuff
/// @function	draw_text_scaled(x, y, text, font, size)
/// @param	{real}		x
/// @param	{real}		y
/// @param	{string}	text
/// @param	{real}		font
/// @param	{real}		size
function draw_text_scaled(_x, _y, _text, _font, _size) {
	var _size_original = font_size;
	var _new_size = (_size / _size_original);
	
	draw_set_font(_font)
	draw_text_transformed(_x, _y, _text, _new_size, _new_size, 0);
}

/// @function	draw_tool_icon(x, y, index, color)
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	index
/// @param	{real}	color
function draw_tool_icon(_x, _y, _index, _col) {
	draw_sprite_part_ext(spr_tools, 0, _index * 16, 0, 16, 16, _x, _y, 1, 1, _col, 1);
}

/// @function	draw_marker_icon(x, y, index, color)
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	index
/// @param	{real}	color
function draw_marker_icon(_x, _y, _index, _col) {
	draw_sprite_part_ext(spr_markers, 0, _index * 16, 0, 16, 16, _x, _y, 1, 1, _col, 1);
}

/// @function	draw_mbcolor_icon(x, y, index, color)
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	index
/// @param	{real}	color
function draw_mbcolor_icon(_x, _y, _index, _col) {
	draw_sprite_part_ext(spr_colors, 0, 0, _index * 16, 130, 16, _x, _y, 1, 1, _col, 1);
}

/// @function	draw_combobox_icon(x, y, index, color)
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	index
/// @param	{real}	color
function draw_combobox_icon(_x, _y, _index, _col) {
	draw_sprite_part_ext(spr_combobox, 0, 2 + _index * 16, 2, 12, 12, _x, _y, 1, 1, _col, 1);
}

#endregion

#region // Colors & Math
/// @function	hex(hex_str)
/// @param	{string}	hex_str
function hex(_str) {
	var _is_hex = (string_char_at(_str, 1) == "#");
	
	if !(_is_hex) {
		return 0;
	}
	
	var _r = hex2rgb(string_copy(_str, 2, 2));
	var _g = hex2rgb(string_copy(_str, 4, 2));
	var _b = hex2rgb(string_copy(_str, 6, 2));
	
	return (rgb(_r, _g, _b));
}

///	@function	hex2rgb(str)
/// @param	{string}	str
function hex2rgb(_str) {
	_str = string_upper(_str);
	var _val = 0;
	
	for (var i = 0; i < 2; i++) {
		var _is_first = (i mod 2 == 0);
		var _char = string_copy(_str, i + 1, 1);
		
		switch (_char) {
			case "0":	_val += ( _is_first ? (16 * 0) : 0 );	break;
			case "1":	_val += ( _is_first ? (16 * 1) : 1 );	break;
			case "2":	_val += ( _is_first ? (16 * 2) : 2 );	break;
			case "3":	_val += ( _is_first ? (16 * 3) : 3 );	break;
			case "4":	_val += ( _is_first ? (16 * 4) : 4 );	break;
			case "5":	_val += ( _is_first ? (16 * 5) : 5 );	break;
			case "6":	_val += ( _is_first ? (16 * 6) : 6 );	break;
			case "7":	_val += ( _is_first ? (16 * 7) : 7 );	break;
			case "8":	_val += ( _is_first ? (16 * 8) : 8 );	break;
			case "9":	_val += ( _is_first ? (16 * 9) : 9 );	break;
			case "A":	_val += ( _is_first ? (16 * 10) : 10 );	break;
			case "B":	_val += ( _is_first ? (16 * 11) : 11 );	break;
			case "C":	_val += ( _is_first ? (16 * 12) : 12 );	break;
			case "D":	_val += ( _is_first ? (16 * 13) : 13 );	break;
			case "E":	_val += ( _is_first ? (16 * 14) : 14 );	break;
			case "F":	_val += ( _is_first ? (16 * 15) : 15 );	break;
		}
	}
	
	return _val;
}
#endregion

/// @function	module_set_active_all(active)
/// @param	{bool}	active
function module_set_active_all(_active) {
	with (parent_Module) {
		ACTIVE = _active;
	}
}

/// @function	window_toggle_maximize()
function window_toggle_maximize() {
	var _maximized = global.__WINDOW_IS_MAXIMIZED;
	global.__WINDOW_IS_MAXIMIZED = !_maximized;
	
	var _screen_w = display_get_width();
	var _screen_h = display_get_height() - 32;
	
	if (_maximized) {
		var _w = global.__WINDOW_LAST_SIZE[0],
			_h = global.__WINDOW_LAST_SIZE[1],
			_x = global.__WINDOW_LAST_POS[0],
			_y = global.__WINDOW_LAST_POS[1];
		window_set_size(_w, _h);
		window_set_position(_x, _y);
	} else {
		global.__WINDOW_LAST_SIZE = [WINDOW_W, WINDOW_H];
		global.__WINDOW_LAST_POS = [WINDOW_X, WINDOW_Y];
		
		window_set_rectangle(0, 0, _screen_w, _screen_h);
	}
}

/// @function	window_toggle_minimize()
function window_toggle_minimize() {
	/* DO NOTHING */
	return -1;
}