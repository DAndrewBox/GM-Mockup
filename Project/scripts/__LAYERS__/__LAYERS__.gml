/// @function	layers_new(id, name, type, [order])
/// @param	{real}		id
/// @param	{string}	name
/// @param	{real}		type
/// @param	{real}		[order]
function layers_new(_id, _name, _type, _order = layers_get_last()) {
	var _layer = {
		id :	_id,
		name :	_name,
		type :	_type,
		order :	_order,
		content: [],
		
	}
	
	return _layer;
}

/// @function	layers_add(type, [id], [name])
/// @param	{real}		type
/// @param	{real}		[id]
/// @param	{string}	[name]
function layers_add(_type, _id = current_time, _name = "Layer " + string(layers_get_last())) {
	o_Module_Layers.LAYERS[| layers_get_last()] = layers_new(_id, _name, _type);
}

/// @function	layers_get_last()
function layers_get_last() {
	return ds_list_size(o_Module_Layers.LAYERS);
}
	
/// @function	layers_draw(layer_struct, x, y, w, h, [is_selected])
/// @param	{struct}	layer_struct
/// @param	{real}		x
/// @param	{real}		y
/// @param	{real}		w
/// @param	{real}		h
/// @param	{bool}		[is_selected]
function layers_draw(_layer, _x, _y, _w, _h, _is_selected = false) {
	
	draw_set_colour(( _is_selected ? col_fg_secondary : col_bg_primary ));
	draw_rectangle(_x, _y, _x + _w, _y + _h, false);
	
	draw_set_colour(( _is_selected ? col_bg_primary : col_bg_secondary ));
	draw_rectangle(_x + 2, _y + 2, _x + 18, _y + _h - 2, false);
	
	draw_tool_icon(_x + 2, _y + 2, 3, ( _is_selected ? col_fg_primary : col_misc_0 ));
	
	draw_set_colour(( _is_selected ? col_misc_0 : col_fg_primary ));
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(font_regular);
	draw_text_ext(_x + 20, _y + 11, string_copy(_layer.name, 1, 32), 9, _w - 20);
		
	if (_is_selected) {
		draw_set_colour(col_fg_primary);
		draw_rectangle(_x + 1, _y + 1, _x + _w - 1, _y + _h - 1, true);
	}
}