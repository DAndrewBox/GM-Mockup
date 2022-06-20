/// @description Mouse actions in corners
if !(global.__WINDOW_IS_MAXIMIZED) {
	var _mouse_out_r = (mouse_ui_x >= WINDOW_W - 3);
	var _mouse_out_d = (mouse_ui_y >= WINDOW_H - 3);

	if (_mouse_out_r && _mouse_out_d) {
		window_set_cursor(cr_size_nwse);
	} else if (_mouse_out_r) {
		window_set_cursor(cr_size_we);
	} else if (_mouse_out_d) {
		window_set_cursor(cr_size_ns);
	} else {
		window_set_cursor(cr_none);
	}

	if (WINDOW_RESIZE) {
		var _window_x = window_get_x();
		var _window_y = window_get_y();
	
		var _window_w = ( WINDOW_RESIZE_R ? max(mouse_ui_x, WINDOWS_MIN_W) : WINDOW_W );
		var _window_h = ( WINDOW_RESIZE_D ? max(mouse_ui_y, WINDOWS_MIN_H) : WINDOW_H );
	
		window_set_size(_window_w, _window_h);
	} else if (WINDOW_DRAG) {
		var _mouse_x = display_mouse_get_x() - MOUSE_DRAG_X;
		var _mouse_y = display_mouse_get_y() - MOUSE_DRAG_Y;
	
		window_set_position(_mouse_x, _mouse_y);
	}
}