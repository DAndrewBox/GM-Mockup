/// @description MB-1 on buttons
if !(ACTIVE) { exit; }

var _mouse_x = mouse_ui_x;
var _mouse_y = mouse_ui_y;

if (_mouse_y <= y + WINDOWS_BAR_YOFF) {
	var _size = array_length(BUTTONS);
	for (var i = 0; i < _size; i++) {
		var _btn = BUTTONS[i];
		var _x = _btn.x;
		var _y = _btn.y;
		var _w = _btn.width;
		var _h = _btn.height;
		var _is_hover = ((_mouse_x >= _x - _w/2 && _mouse_x <= _x + _w/2) && (_mouse_y >= _y - _h/2 && _mouse_y <= _y + _h/2));
		
		if (_is_hover) {
			_btn.func();
			exit;
		}
	}
	
	
	// Drag Window
	if (_mouse_x < WINDOW_W - 112) {
		WINDOW_DRAG = true;
		MOUSE_DRAG_X = _mouse_x;
		MOUSE_DRAG_Y = _mouse_y;
		exit;
	}
}

// Resize Window
if !(global.__WINDOW_IS_MAXIMIZED) {
	var _mouse_out_r = (mouse_ui_x >= WINDOW_W - 3);
	var _mouse_out_d = (mouse_ui_y >= WINDOW_H - 3);

	if (_mouse_out_r || _mouse_out_d) {
		WINDOW_RESIZE = true;
		WINDOW_RESIZE_R = _mouse_out_r;
		WINDOW_RESIZE_D = _mouse_out_d;
	
		global.__WINDOW_IS_MAXIMIZED = false;
		exit;
	}
}