#region // Canvas
/// @function	gui_to_canvas_x(x)
/// @param	{real}	x
function gui_to_canvas_x(_x) {
	var _canvas_x = o_Module_Canvas.CANVAS_X;
	var _canvas_zoom = o_Module_Canvas.CANVAS_ZOOM;
	
	return round((_x - _canvas_x) / _canvas_zoom);
}

/// @function	gui_to_canvas_y(y)
/// @param	{real}	y
function gui_to_canvas_y(_y) {
	var _canvas_y = o_Module_Canvas.CANVAS_Y;
	var _canvas_zoom = o_Module_Canvas.CANVAS_ZOOM;
	
	return round((_y - _canvas_y) / _canvas_zoom);
}
	
#endregion