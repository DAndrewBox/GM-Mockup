#region // Buttons
/// @function	button_clear_all(buttons_array)
/// @param	{array}	buttons_array
function button_clear_all(_arr) {
	var _size = array_length(_arr);
	
	for (var i = 0; i < _size; i++) {
		delete _arr[@ i];
	}
}

/// @function	button_add(text, x, y, on_press, [font], [col_text], [col_bg], [col_hover])
/// @param	{string}	text
/// @param	{real}		x
/// @param	{real}		y
/// @param	{real}		on_press
/// @param	{real}		[font]
/// @param	{real}		[col_text]
/// @param	{real}		[col_bg]
/// @param	{real}		[col_hover]
function button_add(_text, _x, _y, _func) {
	var _font		= ( argument_count > 4 ? argument[4] : font_bold );
	var _col_text	= ( argument_count > 5 ? argument[5] : col_fg_secondary );
	var _col_bg		= ( argument_count > 6 ? argument[6] : col_bg_primary );
	var _col_hover	= ( argument_count > 7 ? argument[7] : col_bg_secondary );
	
	var _is_icon = !(is_string(_text));
	var _icon = ( _is_icon ? _text : -1 );
	_text = ( _is_icon ? "   " : _text);	
	
	draw_set_font(_font);
	var _struct = {
		x			: _x,
		y			: _y,
		text		: _text,
		icon		: _icon,
		func		: _func,
		font		: _font,
		width		: string_width(_text) + 8,
		height		: string_height(_text) + 4,
		col_text	: _col_text,
		col_bg		: _col_bg,
		col_hover	: _col_hover,
		window		: -1
	}
	
	return _struct;
}
	
/// @function	button_draw(button, xoff, yoff, outline)
/// @param	{struct}	button
/// @param	{real}		xoff
/// @param	{real}		yoff
/// @param	{bool}		outline
function button_draw(_btn, _x, _y, _out) {
	/* 
		If _x or _y is array, then use _x[0] to offset collisions
		and _x[1] to offset draw position.
	*/
	var _x_array = is_array(_x);
	var _y_array = is_array(_y);
	
	var _col_x = _btn.x + ( !_x_array ? _x : _x[0] );
	var _col_y = _btn.y + ( !_y_array ? _y : _y[0] );
	
	var _draw_x = _btn.x + ( !_x_array ? _x : _x[1] );
	var _draw_y = _btn.y + ( !_y_array ? _y : _y[1] );
	
	var _x_window = ( _btn.window == -1 ? 0 : _btn.window.x );
	var _y_window = ( _btn.window == -1 ? 0 : _btn.window.y );
	var _mouse_x = mouse_ui_x;
	var _mouse_y = mouse_ui_y;
	var _w = _btn.width;
	var _h = _btn.height;
	
	draw_set_alpha(1);
	draw_set_color(_btn.col_bg);
	draw_rectangle(_draw_x - _w/2, _draw_y - _h/2, _draw_x + _w/2, _draw_y + _h/2, false);
	
	if (_out) {
		draw_set_color(_btn.col_hover);
		draw_rectangle(_draw_x - _w/2, _draw_y - _h/2, _draw_x + _w/2, _draw_y + _h/2, _out);
	}

	if ((_mouse_x >= _x_window + _col_x - _w/2 && _mouse_x <= _x_window + _col_x + _w/2) &&
		(_mouse_y >= _y_window + _col_y - _h/2 && _mouse_y <= _y_window + _col_y + _h/2)) {
		draw_set_color(_btn.col_hover);
		draw_rectangle(_draw_x - _w/2, _draw_y - _h/2, _draw_x + _w/2, _draw_y + _h/2, false);
	}
	
	if (_btn.icon == -1) {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(_btn.col_text);
		draw_text_scaled(_draw_x, _draw_y, _btn.text, _btn.font, 8);
	} else {
		draw_combobox_icon(_draw_x - 6, _draw_y - 6, _btn.icon, _btn.col_text);
	}
}
#endregion