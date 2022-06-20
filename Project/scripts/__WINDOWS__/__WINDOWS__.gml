/// @function	window_new()
function window_new() {
	 return instance_create_depth(0, 0, -100, o_Module_Window);
}

/// @function	window_set(title, x, y, width, height, on_close, [font], [col_text], [col_bg_primary], [col_bg_secondary])
/// @param	{string}	title
/// @param	{real}		x
/// @param	{real}		y
/// @param	{real}		width
/// @param	{real}		height
/// @param	{real}		on_close
/// @param	{real}		[font]
/// @param	{real}		[col_text]
/// @param	{real}		[col_bg_primary]
/// @param	{real}		[col_bg_secondary]
function window_set(_title, _x, _y, _w, _h, _func) {
	var _font		= ( argument_count > 5 ? argument[5] : font_bold );
	var _col_text	= ( argument_count > 6 ? argument[6] : col_fg_secondary );
	var _col_bg_1	= ( argument_count > 7 ? argument[7] : col_bg_primary );
	var _col_bg_2	= ( argument_count > 8 ? argument[8] : col_bg_secondary );
	
	var _struct = {
		x : _x,
		y : _y + WINDOWS_BAR_YOFF,
		title : _title,
		on_close : _func,
		font : _font,
		width : _w,
		height : _h,
		col_text : _col_text,
		col_bg : _col_bg_1,
		col_bg_title: _col_bg_2,
		resizable : false
	}
	
	return _struct;
}
	
/// @function	window_draw(window, x, y)
/// @param	{real}	window
/// @param	{real}	x
/// @param	{real}	y
function window_draw(_id, _x, _y) {
	_x = _x;
	_y = _y;
	
	// Draw window
	draw_set_alpha(1);
	draw_set_color(_id.col_bg);
	draw_roundrect_ext(_x, _y - 13, _x + _id.width, _y + _id.height - 2, 3, 3, false);
	
	draw_set_color(_id.col_bg_title);
	draw_roundrect_ext(_x, _y - 13, _x + _id.width, _y, 3, 3, false);
	draw_roundrect_ext(_x, _y - 13, _x + _id.width - 2, _y + _id.height - 1.5, 3, 3, true);
	
	draw_set_color(col_fg_primary);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_scaled(_x + 3, _y - 5, _id.title, font_regular, 8);
	
	draw_combobox_icon(_x + _id.width - 14, _y - 12, 2, col_misc_0);
}
	
