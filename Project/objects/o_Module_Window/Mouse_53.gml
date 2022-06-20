/// @description MB-1 Press
var _x = WINDOW.x;
var _y = WINDOW.y;
var _w = WINDOW.width;
var _h = WINDOW.height;
var _mb_x = mouse_ui_x;
var _mb_y = mouse_ui_y;

var _mouse_on_y = (_mb_y >= _y && _mb_y <= _y + _h + 12);

if (_mouse_on_y) {
	// Press window title bar
	if (_mb_y <= _y + 12) {
		if (_mb_x >= _x && _mb_x <= _x + _w - 12) {
			// Drag window
			drag = true;
			drag_xoff = _mb_x - _x;
		} else if (_mb_x >= _x + _w - 12 && _mb_x <= _x + _w) {
			// Close window by press the X
			WINDOW.on_close();
			module_set_active_all(true);
			instance_destroy();
		}
		exit;
	}
	
	// Press buttons
	if (BUTTON == -1) {
		exit;
	}
	
	var _size = array_length(BUTTON);
	for (var i = 0; i < _size; i++) {
		var _btn_x = _x + BUTTON[i].x;
		var _btn_y = _y + BUTTON[i].y;
		var _btn_w = BUTTON[i].width;
		var _btn_h = BUTTON[i].height;
		
		if ((_mb_x >= _btn_x - _btn_w/2 && _mb_x <= _btn_x + _btn_w/2) && (_mb_y >= _btn_y - _btn_h/2 + 12 && _mb_y <= _btn_y + _btn_h/2 + 12)) {
			BUTTON[i].func(0);
		}
	}
}