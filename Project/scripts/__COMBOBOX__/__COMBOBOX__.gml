/// @function	combobox_add(text, x, y, width, on_press, [icon_index], [font], [col_text], [col_bg], [col_hover])
/// @param	{string}	text
/// @param	{real}		x
/// @param	{real}		y
/// @param	{real}		width
/// @param	{real}		on_press
/// @param	{real}		[icon_index]
/// @param	{real}		[font]
/// @param	{real}		[col_text]
/// @param	{real}		[col_bg]
/// @param	{real}		[col_hover]
function combobox_add(_text, _x, _y, _w, _func) {
	var _icon_index = ( argument_count > 5 ? argument[5] : 0 );
	var _font		= ( argument_count > 6 ? argument[6] : font_bold );
	var _col_text	= ( argument_count > 7 ? argument[7] : col_fg_secondary );
	var _col_bg		= ( argument_count > 8 ? argument[8] : col_misc_0 );
	var _col_hover	= ( argument_count > 9 ? argument[9] : col_bg_secondary );
	
	draw_set_font(_font);
	var _struct = {
		x : _x,
		y : _y,
		text : _text,
		icon : _icon_index,
		func : _func,
		font : _font,
		width : _w,
		height : string_height(_text) + 4,
		col_text : _col_text,
		col_bg : _col_bg,
		col_hover : _col_hover,
		open : false
	}
	
	return _struct;
}
	
/// @function	combobox_draw(combobox, xoff, yoff, open)
/// @param	{real}	combobox
/// @param	{real}	xoff
/// @param	{real}	yoff
/// @param	{bool}	open
function combobox_draw(_id, _x, _y, _open) {
	_x = _x + _id.x;
	_y = _y + _id.y;
	
	draw_set_alpha(1);
	
	draw_set_color(col_misc_0 * !_open + col_bg_secondary * _open);
	
	draw_rectangle(_x, _y, _x + _id.width, _y + 12, false);
	
	draw_set_color(col_fg_secondary);
	draw_rectangle(_x + 1, _y + 1, _x + _id.width - 1, _y + 11, true);
	draw_rectangle(_x + _id.width, _y, _x + _id.width + 12, _y + 12, false);
	
	draw_set_color(col_fg_secondary * !_open + col_misc_0 * _open);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	var _text_w = string_width(_id.text);
	var _text_to_draw = ( _text_w < _id.width ? _id.text : string_copy(_id.text, 1, 16) + "...");
	draw_text_scaled(_x + 2, _y + 7, _text_to_draw, font_regular, 8);
	
	draw_combobox_icon(_x + _id.width, _y, 0, col_misc_0);
}
	
/// @function	combobox_update_all()
function combobox_update_all() {
	with (parent_Module) {
		if !(variable_instance_exists(id, "COMBOBOX")) {
			continue;
		}
		
		if (is_array(COMBOBOX)) {
			var _size = array_length(COMBOBOX);
			for (var i = 0; i < _size; i++) {
				COMBOBOX[i].open = false;
			}
			event_user(0);
			continue;
		} 
		
		COMBOBOX.open = false;
		event_user(0);
	}
}